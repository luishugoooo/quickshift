// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'torrent_status.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$torrentStatusFilterHash() =>
    r'4aa99ed0be94f95e74aed1902201a46f78e50aac';

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

abstract class _$TorrentStatusFilter
    extends BuildlessNotifier<tf.TorrentStatus> {
  late final Tab? tab;

  tf.TorrentStatus build(
    Tab? tab,
  );
}

/// See also [TorrentStatusFilter].
@ProviderFor(TorrentStatusFilter)
const torrentStatusFilterProvider = TorrentStatusFilterFamily();

/// See also [TorrentStatusFilter].
class TorrentStatusFilterFamily extends Family<tf.TorrentStatus> {
  /// See also [TorrentStatusFilter].
  const TorrentStatusFilterFamily();

  /// See also [TorrentStatusFilter].
  TorrentStatusFilterProvider call(
    Tab? tab,
  ) {
    return TorrentStatusFilterProvider(
      tab,
    );
  }

  @override
  TorrentStatusFilterProvider getProviderOverride(
    covariant TorrentStatusFilterProvider provider,
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
  String? get name => r'torrentStatusFilterProvider';
}

/// See also [TorrentStatusFilter].
class TorrentStatusFilterProvider
    extends NotifierProviderImpl<TorrentStatusFilter, tf.TorrentStatus> {
  /// See also [TorrentStatusFilter].
  TorrentStatusFilterProvider(
    Tab? tab,
  ) : this._internal(
          () => TorrentStatusFilter()..tab = tab,
          from: torrentStatusFilterProvider,
          name: r'torrentStatusFilterProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$torrentStatusFilterHash,
          dependencies: TorrentStatusFilterFamily._dependencies,
          allTransitiveDependencies:
              TorrentStatusFilterFamily._allTransitiveDependencies,
          tab: tab,
        );

  TorrentStatusFilterProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tab,
  }) : super.internal();

  final Tab? tab;

  @override
  tf.TorrentStatus runNotifierBuild(
    covariant TorrentStatusFilter notifier,
  ) {
    return notifier.build(
      tab,
    );
  }

  @override
  Override overrideWith(TorrentStatusFilter Function() create) {
    return ProviderOverride(
      origin: this,
      override: TorrentStatusFilterProvider._internal(
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
  NotifierProviderElement<TorrentStatusFilter, tf.TorrentStatus>
      createElement() {
    return _TorrentStatusFilterProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TorrentStatusFilterProvider && other.tab == tab;
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
mixin TorrentStatusFilterRef on NotifierProviderRef<tf.TorrentStatus> {
  /// The parameter `tab` of this provider.
  Tab? get tab;
}

class _TorrentStatusFilterProviderElement
    extends NotifierProviderElement<TorrentStatusFilter, tf.TorrentStatus>
    with TorrentStatusFilterRef {
  _TorrentStatusFilterProviderElement(super.provider);

  @override
  Tab? get tab => (origin as TorrentStatusFilterProvider).tab;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
