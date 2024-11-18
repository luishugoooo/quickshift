import 'package:quickshift/state/tabs.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/torrent_status.dart' as tf;

part 'torrent_status.g.dart';

@Riverpod(keepAlive: true)
class TorrentStatus extends _$TorrentStatus {
  @override
  tf.TorrentStatus build(Tab tab) {
    return tf.TorrentStatus.all;
  }

  void setFilter(tf.TorrentStatus f) {
    state = f;
  }
}
