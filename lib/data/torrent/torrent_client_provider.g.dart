// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'torrent_client_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$torrentsHash() => r'34c5a48cc66ff6d919e436d4369161e4b92e378f';

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
    int tabId,
  ) {
    return TorrentsProvider(
      tabId,
    );
  }

  @override
  TorrentsProvider getProviderOverride(
    covariant TorrentsProvider provider,
  ) {
    return call(
      provider.tabId,
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
    int tabId,
  ) : this._internal(
          (ref) => torrents(
            ref as TorrentsRef,
            tabId,
          ),
          from: torrentsProvider,
          name: r'torrentsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$torrentsHash,
          dependencies: TorrentsFamily._dependencies,
          allTransitiveDependencies: TorrentsFamily._allTransitiveDependencies,
          tabId: tabId,
        );

  TorrentsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tabId,
  }) : super.internal();

  final int tabId;

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
        tabId: tabId,
      ),
    );
  }

  @override
  FutureProviderElement<List<TorrentData>> createElement() {
    return _TorrentsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TorrentsProvider && other.tabId == tabId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tabId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TorrentsRef on FutureProviderRef<List<TorrentData>> {
  /// The parameter `tabId` of this provider.
  int get tabId;
}

class _TorrentsProviderElement extends FutureProviderElement<List<TorrentData>>
    with TorrentsRef {
  _TorrentsProviderElement(super.provider);

  @override
  int get tabId => (origin as TorrentsProvider).tabId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
