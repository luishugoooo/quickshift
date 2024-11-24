// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tabs.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tabsHash() => r'5338d86cb8cc7dc39256440f4e49dfee7b8cd4b7';

/// See also [Tabs].
@ProviderFor(Tabs)
final tabsProvider = NotifierProvider<Tabs, List<Tab>>.internal(
  Tabs.new,
  name: r'tabsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$tabsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Tabs = Notifier<List<Tab>>;
String _$currentTabHash() => r'dedce7b94cecb89e63169355f4a4b9ba270f1171';

/// See also [CurrentTab].
@ProviderFor(CurrentTab)
final currentTabProvider =
    AutoDisposeNotifierProvider<CurrentTab, Tab>.internal(
  CurrentTab.new,
  name: r'currentTabProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$currentTabHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentTab = AutoDisposeNotifier<Tab>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
