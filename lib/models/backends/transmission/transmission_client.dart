import 'dart:async';

import 'package:dart_transmission_rpc/client.dart';
import 'package:dart_transmission_rpc/model.dart';
import 'package:quickshift/models/backends/torrent_client_interface.dart';
import 'package:quickshift/models/torrent/torrent_data.dart';

class TransmissionClient implements TorrentClientInterface {
  late final TransmissionRpcClient _client;
  @override
  bool get isInitialized => _client.isInited();

  TransmissionClient({
    required String host,
    required String password,
    required String username,
  }) {
    _client = TransmissionRpcClient(
      host: host,
      username: username,
      password: password,
    );
  }

  /* @override
  Future<void> init() async {
    await _client.init();
  } */
  TransmissionClient._create(this._client);

  //didnt like this pattern with regards to providing the client
  static Future<TorrentClientInterface> create({
    required String host,
    required String username,
    required String password,
  }) async {
    final client = TransmissionRpcClient(
      host: host,
      username: username,
      password: password,
    );
    await client.init();
    return TransmissionClient._create(client);
  }

  @override
  void addTorrent(String torrentPath) {
    _client.torrentAdd(TorrentAddRequestArgs(
        fileInfo: TorrentAddFileInfo.byFilename(torrentPath)));
  }

  @override
  Future<List<TorrentData>> getTorrents() async {
    final resp = await _client.torrentGet([
      TorrentGetArgument.name,
      TorrentGetArgument.status,
      TorrentGetArgument.percentDone,
      TorrentGetArgument.rateDownload,
      TorrentGetArgument.rateUpload,
      TorrentGetArgument.totalSize,
      TorrentGetArgument.eta
    ]);

    if (resp.param?.torrents.isEmpty ?? true) {
      return [];
    }
    final res = resp.param!.torrents
        .map(TorrentData.fromTransmissionTorrentInfo)
        .toList();

    return res;
  }

  @override
  void removeTorrent(String torrentHash) {
    // TODO: implement removeTorrent
  }
}
