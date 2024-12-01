import 'dart:async';

import 'package:quickshift/models/torrent/torrent_data.dart';

abstract interface class TorrentClientInterface {
  FutureOr<List<TorrentData>> getTorrents();
  void addTorrent(String torrentPath);
  void removeTorrent(String torrentHash);
  bool get isInitialized;
  Future<TorrentClientInterface> init();
  //TorrentClientInterface.create();
}
