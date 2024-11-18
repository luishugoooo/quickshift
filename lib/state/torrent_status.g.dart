// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'torrent_status.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$torrentStatusHash() => r'13f0592ee8351e6d6b53a75ec6b277098a315638';

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

abstract class _$TorrentStatus extends BuildlessNotifier<tf.TorrentStatus> {
  late final Tab tab;

  tf.TorrentStatus build(
    Tab tab,
  );
}

/// See also [TorrentStatus].
@ProviderFor(TorrentStatus)
const torrentStatusProvider = TorrentStatusFamily();

/// See also [TorrentStatus].
class TorrentStatusFamily extends Family<tf.TorrentStatus> {
  /// See also [TorrentStatus].
  const TorrentStatusFamily();

  /// See also [TorrentStatus].
  TorrentStatusProvider call(
    Tab tab,
  ) {
    return TorrentStatusProvider(
      tab,
    );
  }

  @override
  TorrentStatusProvider getProviderOverride(
    covariant TorrentStatusProvider provider,
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
  String? get name => r'torrentStatusProvider';
}

/// See also [TorrentStatus].
class TorrentStatusProvider
    extends NotifierProviderImpl<TorrentStatus, tf.TorrentStatus> {
  /// See also [TorrentStatus].
  TorrentStatusProvider(
    Tab tab,
  ) : this._internal(
          () => TorrentStatus()..tab = tab,
          from: torrentStatusProvider,
          name: r'torrentStatusProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$torrentStatusHash,
          dependencies: TorrentStatusFamily._dependencies,
          allTransitiveDependencies:
              TorrentStatusFamily._allTransitiveDependencies,
          tab: tab,
        );

  TorrentStatusProvider._internal(
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
  tf.TorrentStatus runNotifierBuild(
    covariant TorrentStatus notifier,
  ) {
    return notifier.build(
      tab,
    );
  }

  @override
  Override overrideWith(TorrentStatus Function() create) {
    return ProviderOverride(
      origin: this,
      override: TorrentStatusProvider._internal(
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
  NotifierProviderElement<TorrentStatus, tf.TorrentStatus> createElement() {
    return _TorrentStatusProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TorrentStatusProvider && other.tab == tab;
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
mixin TorrentStatusRef on NotifierProviderRef<tf.TorrentStatus> {
  /// The parameter `tab` of this provider.
  Tab get tab;
}

class _TorrentStatusProviderElement
    extends NotifierProviderElement<TorrentStatus, tf.TorrentStatus>
    with TorrentStatusRef {
  _TorrentStatusProviderElement(super.provider);

  @override
  Tab get tab => (origin as TorrentStatusProvider).tab;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
