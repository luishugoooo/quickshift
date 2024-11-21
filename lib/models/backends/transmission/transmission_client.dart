import 'package:dart_transmission_rpc/client.dart';
import 'package:dart_transmission_rpc/model.dart';
import 'package:quickshift/models/backends/torrent_client_interface.dart';
import 'package:quickshift/models/torrent/torrent_data.dart';

class TransmissionClient implements TorrentClientInterface {
  final TransmissionRpcClient _client;

  TransmissionClient._create(this._client);

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
  Future<List<TorrentData>> get getTorrents async {
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
    return resp.param!.torrents
        .map(TorrentData.fromTransmissionTorrentInfo)
        .toList();
  }

  @override
  void removeTorrent(String torrentHash) {
    // TODO: implement removeTorrent
  }
}
