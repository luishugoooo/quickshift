import 'dart:async';

import 'package:quickshift/models/torrent/torrent_data.dart';

abstract interface class TorrentClientInterface {
  FutureOr<List<TorrentData>> get getTorrents;
  void addTorrent(String torrentPath);
  void removeTorrent(String torrentHash);
}
