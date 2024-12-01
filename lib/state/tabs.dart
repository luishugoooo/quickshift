// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quickshift/models/backends/torrent_client_interface.dart';
import 'package:quickshift/models/backends/torrent_client_type.dart';
import 'package:quickshift/models/backends/transmission/transmission_client.dart';
import 'package:quickshift/models/server.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "tabs.g.dart";

class Tab {
  final int id;
  final Server? server;
  final TorrentClientInterface? client;
  Tab({
    required this.id,
    this.server,
    this.client,
  });

  Tab copyWith({
    int? id,
    Server? server,
    TorrentClientInterface? client,
  }) {
    return Tab(
      id: id ?? this.id,
      server: server ?? this.server,
      client: client ?? this.client,
    );
  }

  @override
  bool operator ==(covariant Tab other) {
    if (identical(this, other)) return true;

    return other.id == id && other.server == server && other.client == client;
  }

  @override
  int get hashCode => id.hashCode ^ server.hashCode ^ client.hashCode;

  @override
  String toString() => 'Tab(id: $id, server: $server, client: $client)';
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

  void newTab({Server? server, bool setCurrent = true}) {
    final newTabId = state.isEmpty ? 0 : state.last.id + 1;
    final newTab = Tab(id: newTabId, server: server);
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

  void setServer(Tab t, Server s) {
    state = [
      for (final tab in state)
        if (tab == t)
          tab.copyWith(
              server: s,
              client: switch (s.clientType) {
                TorrentClientType.transmission => TransmissionClient(
                    host: s.host, password: s.password, username: s.username),
                TorrentClientType.qbittorrent => throw UnimplementedError(),
              })
        else
          tab
    ];
  }

  Future<void> initClient(int tabId) async {
    for (final tab in state) {
      if (tab.id == tabId) {
        await tab.client?.init();
      }
    }
    state = [...state];
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
