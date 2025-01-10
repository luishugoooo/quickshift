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
String _$tabsHash() => r'b86001b7b0ae3a0b7d3119fbd9c9370fd4363ad2';

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
String _$currentTabIdHash() => r'9ba1cfb3aa166c6b473b1ee252545f5f88c2d8fd';

/// See also [CurrentTabId].
@ProviderFor(CurrentTabId)
final currentTabIdProvider = NotifierProvider<CurrentTabId, int>.internal(
  CurrentTabId.new,
  name: r'currentTabIdProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$currentTabIdHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentTabId = Notifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
