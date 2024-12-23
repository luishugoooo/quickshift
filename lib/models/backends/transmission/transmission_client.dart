// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:quickshift/exceptions/torrent/invalid_transmission_session_id.dart';
import 'package:quickshift/models/backends/torrent_client_interface.dart';
import 'package:quickshift/models/backends/transmission/raw_transmission_torrent_data.dart';
import 'package:quickshift/models/backends/transmission/transmission_server_config.dart';
import 'package:quickshift/models/torrent/torrent_data.dart';

class TransmissionClient implements TorrentClient {
  @override
  final TransmissionServerConfig config;
  final String? sessionId;
  @override
  final TorrentClientStatus clientStatus;
  const TransmissionClient(this.config,
      {this.sessionId, required this.clientStatus});

  @override
  Future<TorrentClient> init() {
    return _getSessionId().then(
      (value) => TransmissionClient(config,
          sessionId: value,
          clientStatus: const TorrentClientStatusInitialized()),
    );
  }

  @override
  TorrentClient updateClientStatus(TorrentClientStatus? value) {
    return TransmissionClient(config,
        sessionId: sessionId, clientStatus: value ?? clientStatus);
  }

  static Map _buildAuthHeader({required TransmissionServerConfig config}) {
    return {
      "Authorization":
          "Basic ${base64.encode(utf8.encode("${config.username}:${config.password}"))}",
    };
  }

  Future<Response> _requestBuilder(
      {required _ClientMethods method,
      Map<String, dynamic>? arguments,
      String? overwrittenSessionId}) async {
    final res = await post(
        Uri(
            scheme: config.https ? "https" : "http",
            host: config.host,
            port: config.port,
            path: config.path),
        body: json.encode({
          "arguments": arguments,
          "method": method.value,
        }),
        headers: {
          ..._buildAuthHeader(config: config),
          "X-Transmission-Session-Id": overwrittenSessionId ?? sessionId ?? ""
        });

    if (res.statusCode == 409 && sessionId != null) {
      throw InvalidTransmissionSessionId();
    }
    return res;
  }

  Future<String> _getSessionId() async {
    final res = await _requestBuilder(method: _ClientMethods.sessionGet);
    final newSessionId = res.headers["x-transmission-session-id"];
    if (res.statusCode == 409) {
      final res2 = await _requestBuilder(
          method: _ClientMethods.sessionGet,
          overwrittenSessionId: newSessionId);
      if (res2.statusCode == 200) {
        Logger().d("Session Established with ID: $newSessionId");
        return newSessionId!;
      } else {
        throw Exception(
            "Failed to establish session, Session Token: ${res2.headers["x-transmission-session-id"]}");
      }
    } else {
      throw Exception(
          "Failed to establish session: ${res.statusCode}: ${res.reasonPhrase}");
    }
  }

  @override
  Future<List<TorrentData>> getTorrents() async {
    final fields = [
      TransmissionTorrentField.id,
      TransmissionTorrentField.name,
      TransmissionTorrentField.totalSize,
      TransmissionTorrentField.status,
      TransmissionTorrentField.percentDone,
      TransmissionTorrentField.rateDownload,
      TransmissionTorrentField.rateUpload,
    ];
    final res =
        await _requestBuilder(method: _ClientMethods.torrentGet, arguments: {
      "fields": [...fields.map((e) => e.value)]
    });
    final decoded = jsonDecode(res.body)["arguments"]["torrents"] as List;
    final rawData = decoded.map((e) => e as Map<String, dynamic>).map((e) {
      return RawTransmissionTorrentData.fromMap(e);
    }).toList();

    return rawData
        .map(
          (e) => TorrentData.fromRawTransmissionData(e),
        )
        .toList();
  }

  @override
  Future<TorrentData> addTorrentFromMagnet(String link) async {
    final res = await _requestBuilder(
        method: _ClientMethods.torrentAdd, arguments: {"filename": link});
    final decode = jsonDecode(res.body);
    final rawResponse = RawTransmissionTorrentData.fromMap(decode);
    return TorrentData.fromRawTransmissionData(rawResponse);
  }

  @override
  Future<void> removeTorrents(List<TorrentData> torrents,
      {required bool deleteLocalData}) async {
    await _requestBuilder(method: _ClientMethods.torrentRemove, arguments: {
      "ids": [
        ...torrents.map(
          (e) => e.id,
        )
      ],
      "delete-local-data": deleteLocalData
    });
    return;
  }

  @override
  Future<void> stopTorrents(List<TorrentData> torrents) async {
    await _requestBuilder(method: _ClientMethods.torrentStop, arguments: {
      "ids": [
        ...torrents.map(
          (e) => e.id,
        )
      ]
    });
    return;
  }

  @override
  Future<void> verifyTorrents(List<TorrentData> torrents) async {
    await _requestBuilder(method: _ClientMethods.torrentVerify, arguments: {
      "ids": [
        ...torrents.map(
          (e) => e.id,
        )
      ]
    });
    return;
  }

  @override
  Future<void> forceStartTorrents(List<TorrentData> torrents) async {
    await _requestBuilder(method: _ClientMethods.torrentStartNow, arguments: {
      "ids": [
        ...torrents.map(
          (e) => e.id,
        )
      ]
    });
    return;
  }

  @override
  Future<void> startTorrents(List<TorrentData> torrents) async {
    await _requestBuilder(method: _ClientMethods.torrentStart, arguments: {
      "ids": [
        ...torrents.map(
          (e) => e.id,
        )
      ]
    });
    return;
  }

  @override
  String get name => config.name;

  @override
  String toString() =>
      'TransmissionClient(config: $config), sessionId: $sessionId, clientStatus: $clientStatus';
}

enum _ClientMethods {
  sessionGet("session-get"),
  torrentAdd("torrent-add"),
  torrentStop("torrent-stop"),
  torrentRemove("torrent-remove"),
  torrentGet("torrent-get"),
  torrentVerify("torrent-verify"),
  torrentStartNow("torrent-start-now"),
  torrentStart("torrent-start");

  final String value;

  const _ClientMethods(this.value);
}
