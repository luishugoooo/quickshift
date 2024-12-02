// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tabs.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentTabHash() => r'bd81de736df7e29d6999135fa2518d801ac5c702';

/// See also [currentTab].
@ProviderFor(currentTab)
final currentTabProvider = AutoDisposeProvider<Tab>.internal(
  currentTab,
  name: r'currentTabProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$currentTabHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentTabRef = AutoDisposeProviderRef<Tab>;
String _$tabsHash() => r'bdd9fb1e50c60a2c171169b5193107895b9983c8';

/// See also [Tabs].
@ProviderFor(Tabs)
final tabsProvider = AutoDisposeNotifierProvider<Tabs, List<Tab>>.internal(
  Tabs.new,
  name: r'tabsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$tabsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Tabs = AutoDisposeNotifier<List<Tab>>;
String _$currentTabIdHash() => r'34287c71b75211015ed5c59dc63040ad06326e10';

/// See also [CurrentTabId].
@ProviderFor(CurrentTabId)
final currentTabIdProvider =
    AutoDisposeNotifierProvider<CurrentTabId, int>.internal(
  CurrentTabId.new,
  name: r'currentTabIdProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$currentTabIdHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentTabId = AutoDisposeNotifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
