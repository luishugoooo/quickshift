import 'package:quickshift/data/torrent/torrent_client_provider.dart';
import 'package:quickshift/models/torrent/torrent_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'torrent_provider.g.dart';

// @Riverpod(keepAlive: true)
// Stream<List<TorrentData>> torrents(Ref ref) async* {
//   final c = ref.watch(currentTabProvider.select(
//     (value) => value.config,
//   ));
//   if (c == null) {
//     throw Exception("Tried to get Torrents without a server config");
//   }
//   final client = ref.watch(torrentClientProvider(c));

//   while (true) {
//     yield await client.getTorrents();
//     await Future.delayed(const Duration(milliseconds: 1000));
//   }
// }

@Riverpod(keepAlive: true)
class Torrents extends _$Torrents {
  @override
  Stream<List<TorrentData>> build() async* {
    ref.watch(currentClientProvider.select(
      (value) => value.config,
    ));
    final client = ref.read(currentClientProvider);

    while (true) {
      yield await client.getTorrents();
      await Future.delayed(const Duration(milliseconds: 10000));
    }
  }

  void addTorrentFromMagnet(String link) {
    final client = ref.read(currentClientProvider);
    client.addTorrentFromMagnet(link);
    ref.invalidateSelf();
  }
}
