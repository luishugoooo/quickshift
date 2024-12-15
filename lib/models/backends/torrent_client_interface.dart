import 'package:quickshift/models/backends/torrent_client_type.dart';
import 'package:quickshift/models/backends/transmission/transmission_client.dart';
import 'package:quickshift/models/backends/transmission/transmission_server_config.dart';
import 'package:quickshift/models/server.dart';
import 'package:quickshift/models/torrent/torrent_data.dart';

abstract interface class TorrentClient {
  abstract final ServerConfig config;
  bool get isInit;
  bool get isConfigured;
  String? get name;

  Future<TorrentClient> init();

  Future<List<TorrentData>> getTorrents();
  Future<TorrentData> addTorrentFromMagnet(String link);

  static TorrentClient fromConfig(ServerConfig config) {
    switch (config.clientType) {
      case TorrentClientType.transmission:
        return TransmissionClient(config as TransmissionServerConfig);
      default:
        throw UnimplementedError();
    }
  }

  @override
  bool operator ==(covariant TorrentClient other) {
    if (identical(this, other)) return true;

    return other.config == config && other.isInit == isInit;
  }

  @override
  int get hashCode => config.hashCode ^ isInit.hashCode;
}
