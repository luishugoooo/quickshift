import 'package:quickshift/data/state/tabs.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/torrent_status.dart' as tf;

part 'torrent_status.g.dart';

@Riverpod(keepAlive: true)
class TorrentStatusFilter extends _$TorrentStatusFilter {
  @override
  tf.TorrentStatus build(Tab? tab) {
    return tf.TorrentStatus.all;
  }

  void setFilter(tf.TorrentStatus f) {
    state = f;
  }
}

@Riverpod(keepAlive: true)
class TorrentSearch extends _$TorrentSearch {
  @override
  String build(Tab t) {
    return "";
  }

  void setSearch(String search) {
    state = search;
  }
}
