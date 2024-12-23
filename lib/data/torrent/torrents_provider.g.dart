// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'torrents_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$filteredTorrentsHash() => r'08b13df338189e7ebee3fe65fd7fed11976020ff';

/// See also [filteredTorrents].
@ProviderFor(filteredTorrents)
final filteredTorrentsProvider =
    AutoDisposeStreamProvider<List<TorrentData>>.internal(
  filteredTorrents,
  name: r'filteredTorrentsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$filteredTorrentsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FilteredTorrentsRef = AutoDisposeStreamProviderRef<List<TorrentData>>;
String _$mockTorrentsHash() => r'28c55ea7229a027141caf2240ccee6bd46b7cec5';

/// See also [mockTorrents].
@ProviderFor(mockTorrents)
final mockTorrentsProvider =
    AutoDisposeStreamProvider<List<TorrentData>>.internal(
  mockTorrents,
  name: r'mockTorrentsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$mockTorrentsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef MockTorrentsRef = AutoDisposeStreamProviderRef<List<TorrentData>>;
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
String _$torrentsHash() => r'e7d1b38a79d85679416de3451ecb45c450d0c054';

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
