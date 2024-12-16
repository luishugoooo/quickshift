// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'torrent_client_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$torrentClientsHash() => r'59304bdaa2955c1735fb2c5b391eb5d3536e827c';

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

abstract class _$TorrentClients
    extends BuildlessNotifier<client.TorrentClient> {
  late final ServerConfig? c;

  client.TorrentClient build(
    ServerConfig? c,
  );
}

/// See also [TorrentClients].
@ProviderFor(TorrentClients)
const torrentClientsProvider = TorrentClientsFamily();

/// See also [TorrentClients].
class TorrentClientsFamily extends Family<client.TorrentClient> {
  /// See also [TorrentClients].
  const TorrentClientsFamily();

  /// See also [TorrentClients].
  TorrentClientsProvider call(
    ServerConfig? c,
  ) {
    return TorrentClientsProvider(
      c,
    );
  }

  @override
  TorrentClientsProvider getProviderOverride(
    covariant TorrentClientsProvider provider,
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
  String? get name => r'torrentClientsProvider';
}

/// See also [TorrentClients].
class TorrentClientsProvider
    extends NotifierProviderImpl<TorrentClients, client.TorrentClient> {
  /// See also [TorrentClients].
  TorrentClientsProvider(
    ServerConfig? c,
  ) : this._internal(
          () => TorrentClients()..c = c,
          from: torrentClientsProvider,
          name: r'torrentClientsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$torrentClientsHash,
          dependencies: TorrentClientsFamily._dependencies,
          allTransitiveDependencies:
              TorrentClientsFamily._allTransitiveDependencies,
          c: c,
        );

  TorrentClientsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.c,
  }) : super.internal();

  final ServerConfig? c;

  @override
  client.TorrentClient runNotifierBuild(
    covariant TorrentClients notifier,
  ) {
    return notifier.build(
      c,
    );
  }

  @override
  Override overrideWith(TorrentClients Function() create) {
    return ProviderOverride(
      origin: this,
      override: TorrentClientsProvider._internal(
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
  NotifierProviderElement<TorrentClients, client.TorrentClient>
      createElement() {
    return _TorrentClientsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TorrentClientsProvider && other.c == c;
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
mixin TorrentClientsRef on NotifierProviderRef<client.TorrentClient> {
  /// The parameter `c` of this provider.
  ServerConfig? get c;
}

class _TorrentClientsProviderElement
    extends NotifierProviderElement<TorrentClients, client.TorrentClient>
    with TorrentClientsRef {
  _TorrentClientsProviderElement(super.provider);

  @override
  ServerConfig? get c => (origin as TorrentClientsProvider).c;
}

String _$currentClientHash() => r'89c7976e06b58726e1273b1cb927a6cfb0563661';

/// See also [CurrentClient].
@ProviderFor(CurrentClient)
final currentClientProvider =
    AutoDisposeNotifierProvider<CurrentClient, TorrentClient>.internal(
  CurrentClient.new,
  name: r'currentClientProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentClientHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentClient = AutoDisposeNotifier<TorrentClient>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
