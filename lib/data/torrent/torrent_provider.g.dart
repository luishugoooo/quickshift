// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'torrent_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$torrentsHash() => r'93b7f9320c00ced516ac941afdc1c8df5f092939';

/// See also [Torrents].
@ProviderFor(Torrents)
final torrentsProvider =
    StreamNotifierProvider<Torrents, List<TorrentData>>.internal(
  Torrents.new,
  name: r'torrentsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$torrentsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Torrents = StreamNotifier<List<TorrentData>>;
String _$torrentDownloadSpeedHistoryHash() =>
    r'ef6e8b5864acfc3c3fc09408fcee99ad5832f7bf';

/// See also [TorrentDownloadSpeedHistory].
@ProviderFor(TorrentDownloadSpeedHistory)
final torrentDownloadSpeedHistoryProvider = AutoDisposeNotifierProvider<
    TorrentDownloadSpeedHistory, CircularBuffer<int>>.internal(
  TorrentDownloadSpeedHistory.new,
  name: r'torrentDownloadSpeedHistoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$torrentDownloadSpeedHistoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TorrentDownloadSpeedHistory
    = AutoDisposeNotifier<CircularBuffer<int>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
