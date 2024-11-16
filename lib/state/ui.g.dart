// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ui.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$uIStateNotifierHash() => r'14e4c1ff0eb84d5bbe72b75b0d75aad3eebabb53';

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

abstract class _$UIStateNotifier extends BuildlessAutoDisposeNotifier<UIState> {
  late final int serverId;

  UIState build(
    int serverId,
  );
}

/// See also [UIStateNotifier].
@ProviderFor(UIStateNotifier)
const uIStateNotifierProvider = UIStateNotifierFamily();

/// See also [UIStateNotifier].
class UIStateNotifierFamily extends Family<UIState> {
  /// See also [UIStateNotifier].
  const UIStateNotifierFamily();

  /// See also [UIStateNotifier].
  UIStateNotifierProvider call(
    int serverId,
  ) {
    return UIStateNotifierProvider(
      serverId,
    );
  }

  @override
  UIStateNotifierProvider getProviderOverride(
    covariant UIStateNotifierProvider provider,
  ) {
    return call(
      provider.serverId,
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
  String? get name => r'uIStateNotifierProvider';
}

/// See also [UIStateNotifier].
class UIStateNotifierProvider
    extends AutoDisposeNotifierProviderImpl<UIStateNotifier, UIState> {
  /// See also [UIStateNotifier].
  UIStateNotifierProvider(
    int serverId,
  ) : this._internal(
          () => UIStateNotifier()..serverId = serverId,
          from: uIStateNotifierProvider,
          name: r'uIStateNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$uIStateNotifierHash,
          dependencies: UIStateNotifierFamily._dependencies,
          allTransitiveDependencies:
              UIStateNotifierFamily._allTransitiveDependencies,
          serverId: serverId,
        );

  UIStateNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.serverId,
  }) : super.internal();

  final int serverId;

  @override
  UIState runNotifierBuild(
    covariant UIStateNotifier notifier,
  ) {
    return notifier.build(
      serverId,
    );
  }

  @override
  Override overrideWith(UIStateNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: UIStateNotifierProvider._internal(
        () => create()..serverId = serverId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        serverId: serverId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<UIStateNotifier, UIState> createElement() {
    return _UIStateNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UIStateNotifierProvider && other.serverId == serverId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, serverId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UIStateNotifierRef on AutoDisposeNotifierProviderRef<UIState> {
  /// The parameter `serverId` of this provider.
  int get serverId;
}

class _UIStateNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<UIStateNotifier, UIState>
    with UIStateNotifierRef {
  _UIStateNotifierProviderElement(super.provider);

  @override
  int get serverId => (origin as UIStateNotifierProvider).serverId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
