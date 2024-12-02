// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quickshift/models/backends/torrent_client_interface.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "tabs.g.dart";

class Tab {
  final int id;
  final TorrentClientInterface? client;
  Tab({
    required this.id,
    this.client,
  });

  Tab copyWith({
    int? id,
    TorrentClientInterface? client,
  }) {
    return Tab(
      id: id ?? this.id,
      client: client ?? this.client,
    );
  }
}

@Riverpod(keepAlive: false)
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
}

@Riverpod(keepAlive: false)
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
