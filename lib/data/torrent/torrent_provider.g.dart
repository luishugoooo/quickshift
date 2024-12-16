// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'torrent_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$torrentsHash() => r'0789be8238b56bd45514a66e71fa72471369b352';

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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
