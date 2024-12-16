import 'package:quickshift/data/torrent/torrent_client_provider.dart';
import 'package:quickshift/models/backends/torrent_client_interface.dart';
import 'package:quickshift/models/torrent/torrent_data.dart';
import 'package:quickshift/widgets/util/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'torrent_provider.g.dart';

@Riverpod(keepAlive: true)
class Torrents extends _$Torrents {
  @override
  Stream<List<TorrentData>> build() async* {
    final client = ref.watch(currentClientProvider);

    while (client.clientStatus is TorrentClientStatusInitialized) {
      ref.read(loggingProvider.notifier).log("Refresh");
      yield await client.getTorrents();
      await Future.delayed(const Duration(seconds: 3));
    }
  }

  Future<void> addTorrentFromMagnet(String link) async {
    final client = ref.read(currentClientProvider);
    await client.addTorrentFromMagnet(link);
    ref.invalidateSelf();
  }

  void removeTorrents(List<TorrentData> torrent,
      {bool deleteLocalData = false}) async {
    final client = ref.read(currentClientProvider);
    await client.removeTorrents(torrent, deleteLocalData: deleteLocalData);
    ref.invalidateSelf();
  }
}
