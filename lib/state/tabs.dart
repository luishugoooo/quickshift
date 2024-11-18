// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:quickshift/models/server.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "tabs.g.dart";

class Tab {
  final int id;
  final Server? server;
  Tab({
    required this.id,
    this.server,
  });

  Tab copyWith({
    int? id,
    Server? server,
  }) {
    return Tab(
      id: id ?? this.id,
      server: server ?? this.server,
    );
  }

  @override
  bool operator ==(covariant Tab other) {
    if (identical(this, other)) return true;

    return other.id == id && other.server == server;
  }

  @override
  int get hashCode => id.hashCode ^ server.hashCode;
}

@riverpod
class Tabs extends _$Tabs {
  @override
  List<Tab> build() {
    return [Tab(id: 0)];
  }

  void newTab({Server? server, bool setCurrent = true}) {
    final newTabId = state.isEmpty ? 0 : state.last.id + 1;
    final newTab = Tab(id: newTabId, server: server);
    state = [...state, newTab];
    if (setCurrent) {
      ref.read(currentTabProvider.notifier).selectTab(newTab);
    }
  }

  void closeTab(Tab t) {
    print("Removing tab ${t.id}");
    if (t == ref.read(currentTabProvider)) {
      ref
          .read(currentTabProvider.notifier)
          .selectTab(state[max(state.indexOf(t) - 1, 0)]);
    }
    state = [...state..remove(t)];
  }
}

@riverpod
class CurrentTab extends _$CurrentTab {
  @override
  Tab build() {
    return ref.read(tabsProvider).first;
  }

  void selectTab(Tab t) {
    state = ref.read(tabsProvider).firstWhere(
          (element) => element == t,
        );
  }
}
