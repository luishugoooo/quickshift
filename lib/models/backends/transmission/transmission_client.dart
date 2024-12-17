// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:quickshift/models/backends/torrent_client_interface.dart';
import 'package:quickshift/models/backends/transmission/raw_transmission_torrent_data.dart';
import 'package:quickshift/models/backends/transmission/transmission_server_config.dart';
import 'package:quickshift/models/torrent/torrent_data.dart';

import 'lib.dart' as lib;

class TransmissionClient implements TorrentClient {
  @override
  final TransmissionServerConfig config;
  final String? sessionId;
  @override
  final TorrentClientStatus clientStatus;
  const TransmissionClient(this.config,
      {this.sessionId, required this.clientStatus});

  @override
  Future<List<TorrentData>> getTorrents() {
    return lib.getTorrents(config: config, sessionId: sessionId, fields: [
      TransmissionTorrentField.id,
      TransmissionTorrentField.name,
      TransmissionTorrentField.status,
      TransmissionTorrentField.percentDone,
      TransmissionTorrentField.rateDownload,
      TransmissionTorrentField.rateUpload,
    ]).then((value) => value
        .map(
          (e) => TorrentData.fromRawTransmissionData(e),
        )
        .toList());
  }

  @override
  String get name => config.name;

  @override
  String toString() =>
      'TransmissionClient(config: $config), sessionId: $sessionId, clientStatus: $clientStatus';

  @override
  Future<TorrentClient> init() {
    return lib.init(config).then(
          (value) => TransmissionClient(config,
              sessionId: value,
              clientStatus: const TorrentClientStatusInitialized()),
        );
  }

  @override
  Future<TorrentData> addTorrentFromMagnet(String link) async {
    return TorrentData.fromRawTransmissionData(await lib.addTorrentFromMagnet(
        config: config, sessionId: sessionId!, magnetLink: link));
  }

  @override
  TorrentClient updateClientStatus(TorrentClientStatus? value) {
    return TransmissionClient(config,
        sessionId: sessionId, clientStatus: value ?? clientStatus);
  }

  @override
  Future<void> removeTorrents(List<TorrentData> torrents,
      {required bool deleteLocalData}) async {
    return await lib.removeTorrent(
        config: config,
        sessionId: sessionId,
        torrents: torrents,
        deleteLocalData: deleteLocalData);
  }
}
