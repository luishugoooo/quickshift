import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quickshift/data/torrent/torrent_client_provider.dart';
import 'package:quickshift/models/torrent/torrent_data.dart';
import 'package:quickshift/state/tabs.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'torrent_provider.g.dart';

@Riverpod(keepAlive: true)
Stream<List<TorrentData>> torrents(Ref ref) async* {
  final c = ref.watch(currentTabProvider.select(
    (value) => value.config,
  ));
  if (c == null) {
    throw Exception("Tried to get Torrents without a server config");
  }
  final client = ref.watch(torrentClientProvider(c));

  while (true) {
    yield await client.getTorrents();
    await Future.delayed(const Duration(milliseconds: 1000));
  }
}
