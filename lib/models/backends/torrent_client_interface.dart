import 'dart:async';

import 'package:quickshift/models/backends/transmission/transmission_client.dart';
import 'package:quickshift/models/torrent/torrent_data.dart';

abstract interface class TorrentClientInterface {
  FutureOr<List<TorrentData>> getTorrents();
  void addTorrent(String torrentPath);
  void removeTorrent(String torrentHash);
  bool get isInitialized;
  Future<void> init();
  TorrentClientInterface copyWith();
  //TorrentClientInterface.create();
}

enum TorrentClientType { transmission }
