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
class TabsNotifier extends _$TabsNotifier {
  @override
  List<Tab> build() {
    return [Tab(id: 0)];
  }

  void newTab(Server? server) {
    final newTabId = state.isEmpty ? 0 : state.last.id + 1;
    state = [...state, Tab(id: newTabId, server: server)];
  }
}

@riverpod
class CurrentTab extends _$CurrentTab {
  @override
  int build() {
    return 0;
  }

  void selectTab(int i) {
    assert(i >= 0 && i < ref.read(tabsNotifierProvider).length);
    state = i;
  }
}
