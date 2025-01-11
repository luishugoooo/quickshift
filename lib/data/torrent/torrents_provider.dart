import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quickshift/data/database/settings/settings_notifier.dart';
import 'package:quickshift/data/state/tabs.dart';
import 'package:quickshift/data/state/torrent_status.dart';
import 'package:quickshift/data/torrent/torrent_client_provider.dart';
import 'package:quickshift/exceptions/torrent/invalid_transmission_session_id.dart';
import 'package:quickshift/models/backends/options/add_torrent_options.dart';
import 'package:quickshift/models/backends/torrent_client_interface.dart';
import 'package:quickshift/models/torrent/torrent_data.dart';
import 'package:quickshift/models/torrent_status.dart';
import 'package:quickshift/widgets/util/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'torrents_provider.g.dart';

@Riverpod(keepAlive: true)
class Torrents extends _$Torrents {
  @override
  Stream<List<TorrentData>> build() async* {
    final client = ref.watch(currentClientProvider);
    while (client.clientStatus is TorrentClientStatusInitialized) {
      ref.read(loggingProvider.notifier).log("Refresh");
      final updateInterval = ref.read(settingsProvider.select(
        (data) => data.fetchInterval,
      ));

      yield await client.getTorrents().catchError((error) async {
        if (error is InvalidTransmissionSessionId) {
          await ref.watch(currentClientProvider.notifier).init();
          return <TorrentData>[];
        }
        throw error;
      });

      await Future.delayed(Duration(milliseconds: updateInterval));
    }
  }

  Future<void> addTorrent(AddTorrentOptions options) async {
    final client = ref.read(currentClientProvider);
    await client.addTorrent(options);
    ref.invalidateSelf();
  }

  Future<void> removeTorrents(List<TorrentData> torrent,
      {bool deleteLocalData = false}) async {
    final client = ref.read(currentClientProvider);
    await client.removeTorrents(torrent, deleteLocalData: deleteLocalData);
    ref.invalidateSelf();
  }

  void stopTorrents(List<TorrentData> torrent) async {
    final client = ref.read(currentClientProvider);
    await client.stopTorrents(torrent);
    ref.invalidateSelf();
  }

  void verifyTorrents(List<TorrentData> torrent) async {
    final client = ref.read(currentClientProvider);
    await client.verifyTorrents(torrent);
    ref.invalidateSelf();
  }

  void forceStartTorrents(List<TorrentData> torrent) async {
    final client = ref.read(currentClientProvider);
    await client.forceStartTorrents(torrent);
    ref.invalidateSelf();
  }

  void startTorrents(List<TorrentData> torrent) async {
    final client = ref.read(currentClientProvider);
    await client.startTorrents(torrent);
    ref.invalidateSelf();
  }

  void reannounceTorrents(List<TorrentData> torrent) async {
    final client = ref.read(currentClientProvider);
    await client.reannounceTorrents(torrent);
    ref.invalidateSelf();
  }
}

@riverpod
Stream<List<TorrentData>> filteredTorrents(Ref ref) async* {
  final currentTab = ref.watch(currentTabProvider);
  final settings = ref.watch(settingsProvider);
  final filter = ref.watch(torrentStatusFilterProvider(
      settings.synchronizeFiltersAcrossTabs ? null : currentTab));
  final search = ref.watch(torrentSearchProvider(currentTab));
  final torrents = ref.watch(torrentsProvider).when(
        data: (data) => data,
        error: (error, stackTrace) => null,
        loading: () => null,
      );
  if (torrents == null) return;
  yield torrents
      .where(
        (element) => filter == TorrentStatus.all || element.status == filter,
      )
      .where(
        (element) =>
            element.name?.toLowerCase().contains(search.toLowerCase()) ?? true,
      )
      .toList();
}

@riverpod
class SelectedTorrentId extends _$SelectedTorrentId {
  @override
  int? build() {
    return null;
  }

  void select(int t) {
    state = t;
  }
}

@riverpod
TorrentData? selectedTorrent(Ref ref) {
  final torrents = ref.watch(torrentsProvider).when(
        data: (data) => data,
        error: (error, stackTrace) => null,
        loading: () => null,
      );
  if (torrents == null || torrents.isEmpty) return null;
  final selectedId = ref.watch(selectedTorrentIdProvider);
  return torrents
      .where(
        (element) => element.id == selectedId,
      )
      .firstOrNull;
}
