import 'package:quickshift/models/backends/torrent_client_interface.dart';
import 'package:quickshift/models/server.dart';
import 'package:quickshift/models/torrent/torrent_data.dart';

class UnconfiguredTorrentClient implements TorrentClient {
  @override
  Future<TorrentData> addTorrentFromMagnet(String link) {
    throw UnsupportedError("Cannot add torrents to unconfigured client");
  }

  @override
  ServerConfig get config =>
      throw UnsupportedError("Cannot get config from unconfigured client");

  @override
  Future<List<TorrentData>> getTorrents() {
    throw UnsupportedError("Cannot get torrents from unconfigured client");
  }

  @override
  Future<TorrentClient> init() {
    throw UnsupportedError("Cannot init unconfigured client");
  }

  @override
  String get name => "Not connected";

  @override
  TorrentClientStatus get clientStatus =>
      const TorrentClientStatusUnconfigured();

  @override
  TorrentClient updateClientStatus(TorrentClientStatus value) {
    throw UnsupportedError("Cannot update status of unconfigured client");
  }
}
