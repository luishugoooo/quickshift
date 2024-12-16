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
  const TransmissionClient(this.config, {this.sessionId});

  @override
  Future<List<TorrentData>> getTorrents() {
    return lib.getTorrents(config: config, sessionId: sessionId, fields: [
      TransmissionTorrentField.id,
      TransmissionTorrentField.name,
      TransmissionTorrentField.status,
      TransmissionTorrentField.percentDone
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
      'TransmissionClient(config: $config), sessionId: $sessionId, isInit: $isInit';

  @override
  Future<TorrentClient> init() {
    return lib.init(config).then(
          (value) => TransmissionClient(config, sessionId: value),
        );
  }

  @override
  bool get isInit => sessionId != null;

  @override
  Future<TorrentData> addTorrentFromMagnet(String link) async {
    return TorrentData.fromRawTransmissionData(await lib.addTorrentFromMagnet(
        config: config, sessionId: sessionId!, magnetLink: link));
  }

  @override
  bool get isConfigured => true;
}
