// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'torrent_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$selectedTorrentHash() => r'a5c1e09514e5047e336642e089a7d0d1fe219716';

/// See also [selectedTorrent].
@ProviderFor(selectedTorrent)
final selectedTorrentProvider = AutoDisposeProvider<TorrentData?>.internal(
  selectedTorrent,
  name: r'selectedTorrentProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedTorrentHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SelectedTorrentRef = AutoDisposeProviderRef<TorrentData?>;
String _$torrentsHash() => r'4a01cab1ede7b0d4ea4c90335740520750b1a213';

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
String _$selectedTorrentIdHash() => r'44bcbe4a6bbb6b5fee1e00e8bae1876a02a74e38';

/// See also [SelectedTorrentId].
@ProviderFor(SelectedTorrentId)
final selectedTorrentIdProvider =
    AutoDisposeNotifierProvider<SelectedTorrentId, int?>.internal(
  SelectedTorrentId.new,
  name: r'selectedTorrentIdProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedTorrentIdHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedTorrentId = AutoDisposeNotifier<int?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
