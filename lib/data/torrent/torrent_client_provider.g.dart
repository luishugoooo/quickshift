// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'torrent_client_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$torrentsHash() => r'ed6aeb135693b7b774776fe53789fd00e9e86d52';

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

/// See also [torrents].
@ProviderFor(torrents)
const torrentsProvider = TorrentsFamily();

/// See also [torrents].
class TorrentsFamily extends Family<AsyncValue<List<TorrentData>>> {
  /// See also [torrents].
  const TorrentsFamily();

  /// See also [torrents].
  TorrentsProvider call(
    Tab tab,
  ) {
    return TorrentsProvider(
      tab,
    );
  }

  @override
  TorrentsProvider getProviderOverride(
    covariant TorrentsProvider provider,
  ) {
    return call(
      provider.tab,
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
  String? get name => r'torrentsProvider';
}

/// See also [torrents].
class TorrentsProvider extends FutureProvider<List<TorrentData>> {
  /// See also [torrents].
  TorrentsProvider(
    Tab tab,
  ) : this._internal(
          (ref) => torrents(
            ref as TorrentsRef,
            tab,
          ),
          from: torrentsProvider,
          name: r'torrentsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$torrentsHash,
          dependencies: TorrentsFamily._dependencies,
          allTransitiveDependencies: TorrentsFamily._allTransitiveDependencies,
          tab: tab,
        );

  TorrentsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tab,
  }) : super.internal();

  final Tab tab;

  @override
  Override overrideWith(
    FutureOr<List<TorrentData>> Function(TorrentsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TorrentsProvider._internal(
        (ref) => create(ref as TorrentsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tab: tab,
      ),
    );
  }

  @override
  FutureProviderElement<List<TorrentData>> createElement() {
    return _TorrentsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TorrentsProvider && other.tab == tab;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tab.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TorrentsRef on FutureProviderRef<List<TorrentData>> {
  /// The parameter `tab` of this provider.
  Tab get tab;
}

class _TorrentsProviderElement extends FutureProviderElement<List<TorrentData>>
    with TorrentsRef {
  _TorrentsProviderElement(super.provider);

  @override
  Tab get tab => (origin as TorrentsProvider).tab;
}

String _$torrentClientHash() => r'40f3d05229daecaa317693a7108ed292ba8fcaf8';

abstract class _$TorrentClient
    extends BuildlessNotifier<TorrentClientInterface?> {
  late final Tab tab;

  TorrentClientInterface? build(
    Tab tab,
  );
}

/// See also [TorrentClient].
@ProviderFor(TorrentClient)
const torrentClientProvider = TorrentClientFamily();

/// See also [TorrentClient].
class TorrentClientFamily extends Family<TorrentClientInterface?> {
  /// See also [TorrentClient].
  const TorrentClientFamily();

  /// See also [TorrentClient].
  TorrentClientProvider call(
    Tab tab,
  ) {
    return TorrentClientProvider(
      tab,
    );
  }

  @override
  TorrentClientProvider getProviderOverride(
    covariant TorrentClientProvider provider,
  ) {
    return call(
      provider.tab,
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
    extends NotifierProviderImpl<TorrentClient, TorrentClientInterface?> {
  /// See also [TorrentClient].
  TorrentClientProvider(
    Tab tab,
  ) : this._internal(
          () => TorrentClient()..tab = tab,
          from: torrentClientProvider,
          name: r'torrentClientProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$torrentClientHash,
          dependencies: TorrentClientFamily._dependencies,
          allTransitiveDependencies:
              TorrentClientFamily._allTransitiveDependencies,
          tab: tab,
        );

  TorrentClientProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tab,
  }) : super.internal();

  final Tab tab;

  @override
  TorrentClientInterface? runNotifierBuild(
    covariant TorrentClient notifier,
  ) {
    return notifier.build(
      tab,
    );
  }

  @override
  Override overrideWith(TorrentClient Function() create) {
    return ProviderOverride(
      origin: this,
      override: TorrentClientProvider._internal(
        () => create()..tab = tab,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tab: tab,
      ),
    );
  }

  @override
  NotifierProviderElement<TorrentClient, TorrentClientInterface?>
      createElement() {
    return _TorrentClientProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TorrentClientProvider && other.tab == tab;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tab.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TorrentClientRef on NotifierProviderRef<TorrentClientInterface?> {
  /// The parameter `tab` of this provider.
  Tab get tab;
}

class _TorrentClientProviderElement
    extends NotifierProviderElement<TorrentClient, TorrentClientInterface?>
    with TorrentClientRef {
  _TorrentClientProviderElement(super.provider);

  @override
  Tab get tab => (origin as TorrentClientProvider).tab;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
