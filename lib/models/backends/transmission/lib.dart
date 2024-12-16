import 'dart:convert';

import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:quickshift/exceptions/torrent/invalid_transmission_session_id.dart';
import 'package:quickshift/models/backends/transmission/raw_transmission_torrent_data.dart';
import 'package:quickshift/models/backends/transmission/transmission_server_config.dart';

import '../../torrent/torrent_data.dart';

Future<String> init(TransmissionServerConfig config) async {
  final res = await _initConnection(config);
  final sessionId = res.headers["x-transmission-session-id"];
  if (res.statusCode == 409) {
    final res2 = await _initConnection(config, sessionId: sessionId);
    if (res2.statusCode == 200) {
      Logger().d("Session Established with ID: $sessionId");
      return sessionId!;
    } else {
      throw Exception(
          "Failed to establish session, Session Token: ${res2.headers["x-transmission-session-id"]}");
    }
  } else {
    throw Exception(
        "Failed to establish session: ${res.statusCode}: ${res.reasonPhrase}");
  }
}

Map _buildAuthHeader({required TransmissionServerConfig config}) {
  return {
    "Authorization":
        "Basic ${base64.encode(utf8.encode("${config.username}:${config.password}"))}",
  };
}

Future<Response> _requestBuilder({
  required _ClientMethods method,
  Map<String, dynamic>? arguments,
  required TransmissionServerConfig config,
  required String? sessionId,
}) async {
  print(json.encode({
    "arguments": arguments,
    "method": method.value,
  }));
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
        "X-Transmission-Session-Id": sessionId ?? ""
      });

  if (res.statusCode == 409 && sessionId != null) {
    throw InvalidTransmissionSessionId();
  }
  return res;
}

Future<Response> _initConnection(TransmissionServerConfig config,
    {String? sessionId}) async {
  return await _requestBuilder(
      method: _ClientMethods.sessionGet,
      config: config,
      sessionId: sessionId,
      arguments: {
        "fields": ["version"]
      });
}

Future<List<RawTransmissionTorrentData>> getTorrents(
    {required List<TransmissionTorrentField> fields,
    required TransmissionServerConfig config,
    required String? sessionId}) async {
  final res = await _requestBuilder(
      method: _ClientMethods.torrentGet,
      config: config,
      sessionId: sessionId,
      arguments: {
        "fields": [...fields.map((e) => e.value)]
      });
  final decoded = jsonDecode(res.body)["arguments"]["torrents"] as List;
  return decoded.map((e) => e as Map<String, dynamic>).map((e) {
    print(e);
    return RawTransmissionTorrentData.fromMap(e);
  }).toList();
}

Future<RawTransmissionTorrentData> addTorrentFromMagnet({
  required TransmissionServerConfig config,
  required String? sessionId,
  required String magnetLink,
}) async {
  final res = await _requestBuilder(
      method: _ClientMethods.torrentAdd,
      config: config,
      sessionId: sessionId,
      arguments: {"filename": magnetLink});
  final decode = jsonDecode(res.body);
  return RawTransmissionTorrentData.fromMap(decode);
}

Future<void> removeTorrent(
    {required TransmissionServerConfig config,
    required String? sessionId,
    required List<TorrentData> torrents,
    required bool deleteLocalData}) async {
  await _requestBuilder(
      method: _ClientMethods.torrentRemove,
      config: config,
      sessionId: sessionId,
      arguments: {
        "ids": [
          ...torrents.map(
            (e) => e.id,
          )
        ],
        "delete-local-data": deleteLocalData
      });

  return;
}

enum _ClientMethods {
  sessionGet("session-get"),
  torrentAdd("torrent-add"),
  torrentStop("torrent-stop"),
  torrentRemove("torrent-remove"),
  torrentGet("torrent-get");

  final String value;

  const _ClientMethods(this.value);
}
