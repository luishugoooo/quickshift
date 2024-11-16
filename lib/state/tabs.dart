// ignore_for_file: public_member_api_docs, sort_constructors_first
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
}

@riverpod
class Tabs extends _$Tabs {
  @override
  List<Tab> build() {
    return [Tab(id: 0)];
  }

  void newTab({Server? server, bool setCurrent = true}) {
    final newTabId = state.isEmpty ? 0 : state.last.id + 1;
    state = [...state, Tab(id: newTabId, server: server)];
    if (setCurrent) {
      ref.read(currentTabProvider.notifier).selectTab(newTabId);
    }
  }
}

@riverpod
class CurrentTab extends _$CurrentTab {
  @override
  Tab build() {
    return ref.read(tabsProvider).first;
  }

  void selectTab(int i) {
    assert(i >= 0 && i < ref.read(tabsProvider).length);

    state = ref.read(tabsProvider)[i];
  }
}
