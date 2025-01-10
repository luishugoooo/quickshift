// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quickshift/models/backends/server_config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "tabs.g.dart";

class Tab {
  final int id;
  final ServerConfig? config;
  Tab({
    required this.id,
    this.config,
  });

  Tab copyWith({
    int? id,
    ServerConfig? config,
  }) {
    return Tab(
      id: id ?? this.id,
      config: config ?? this.config,
    );
  }

  @override
  String toString() => 'Tab(id: $id, client: $config)';

  @override
  bool operator ==(covariant Tab other) {
    if (identical(this, other)) return true;

    return other.id == id && other.config == config;
  }

  @override
  int get hashCode => id.hashCode ^ config.hashCode;
}

@Riverpod(keepAlive: true)
class Tabs extends _$Tabs {
  @override
  List<Tab> build() {
    return [
      Tab(
        id: 0,
      )
    ];
  }

  void newTab({bool setCurrent = true}) {
    final newTabId = state.isEmpty ? 0 : state.last.id + 1;
    final newTab = Tab(id: newTabId);
    state = [...state, newTab];
    if (setCurrent) {
      ref.read(currentTabIdProvider.notifier).selectTab(newTab.id);
    }
  }

  void closeTab(Tab t) {
    if (state.length == 1) return;
    if (t.id == ref.read(currentTabIdProvider)) {
      if (state.last == t) {
        ref
            .read(currentTabIdProvider.notifier)
            .selectTab(state[state.length - 2].id);
      } else {
        ref
            .read(currentTabIdProvider.notifier)
            .selectTab(state[state.indexOf(t) + 1].id);
      }
    }
    state = [...state..remove(t)];
  }

  Tab setConfig(Tab t, ServerConfig config) {
    t = t.copyWith(config: config);

    state = [
      for (final tab in state)
        if (tab.id == t.id) t else tab
    ];
    return t;
  }

  void moveTab(Tab t, Tab to, bool after) {
    final index = state.indexOf(t);
    final toIndex = state.indexOf(to);
    final newTabs = [...state];
    newTabs.removeAt(index);
    newTabs.insert(
        max(
            0,
            after
                ? (index > toIndex)
                    ? toIndex + 1
                    : toIndex
                : (index < toIndex)
                    ? toIndex - 1
                    : toIndex),
        t);
    state = newTabs;
  }
}

@Riverpod(keepAlive: true)
class CurrentTabId extends _$CurrentTabId {
  @override
  int build() {
    return 0;
  }

  void selectTab(int id) {
    state = id;
  }
}

@Riverpod(keepAlive: false)
Tab currentTab(Ref ref) {
  final tabs = ref.watch(tabsProvider);
  return tabs.firstWhere((tab) => tab.id == ref.watch(currentTabIdProvider));
}
