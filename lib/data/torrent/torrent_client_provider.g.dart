// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'torrent_client_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$torrentClientHash() => r'17953905e73953417882c6d64ccddcac3c05b7b3';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$TorrentClient extends BuildlessNotifier<client.TorrentClient> {
  late final ServerConfig c;

  client.TorrentClient build(
    ServerConfig c,
  );
}

/// See also [TorrentClient].
@ProviderFor(TorrentClient)
const torrentClientProvider = TorrentClientFamily();

/// See also [TorrentClient].
class TorrentClientFamily extends Family<client.TorrentClient> {
  /// See also [TorrentClient].
  const TorrentClientFamily();

  /// See also [TorrentClient].
  TorrentClientProvider call(
    ServerConfig c,
  ) {
    return TorrentClientProvider(
      c,
    );
  }

  @override
  TorrentClientProvider getProviderOverride(
    covariant TorrentClientProvider provider,
  ) {
    return call(
      provider.c,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'torrentClientProvider';
}

/// See also [TorrentClient].
class TorrentClientProvider
    extends NotifierProviderImpl<TorrentClient, client.TorrentClient> {
  /// See also [TorrentClient].
  TorrentClientProvider(
    ServerConfig c,
  ) : this._internal(
          () => TorrentClient()..c = c,
          from: torrentClientProvider,
          name: r'torrentClientProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$torrentClientHash,
          dependencies: TorrentClientFamily._dependencies,
          allTransitiveDependencies:
              TorrentClientFamily._allTransitiveDependencies,
          c: c,
        );

  TorrentClientProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.c,
  }) : super.internal();

  final ServerConfig c;

  @override
  client.TorrentClient runNotifierBuild(
    covariant TorrentClient notifier,
  ) {
    return notifier.build(
      c,
    );
  }

  @override
  Override overrideWith(TorrentClient Function() create) {
    return ProviderOverride(
      origin: this,
      override: TorrentClientProvider._internal(
        () => create()..c = c,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        c: c,
      ),
    );
  }

  @override
  NotifierProviderElement<TorrentClient, client.TorrentClient> createElement() {
    return _TorrentClientProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TorrentClientProvider && other.c == c;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, c.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TorrentClientRef on NotifierProviderRef<client.TorrentClient> {
  /// The parameter `c` of this provider.
  ServerConfig get c;
}

class _TorrentClientProviderElement
    extends NotifierProviderElement<TorrentClient, client.TorrentClient>
    with TorrentClientRef {
  _TorrentClientProviderElement(super.provider);

  @override
  ServerConfig get c => (origin as TorrentClientProvider).c;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
