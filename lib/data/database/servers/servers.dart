import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:quickshift/models/backends/server_config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'servers.g.dart';

@riverpod
class StoredServers extends _$StoredServers {
  @override
  List<ServerConfig> build() {
    return fetch();
  }

  List<ServerConfig> fetch() {
    final box = Hive.box("servers");
    final servers = box.values.map((e) => ServerConfig.fromMap(e)).toList();
    return servers;
  }

  int _generateKey() {
    final box = Hive.box("servers");
    final keys = box.keys.toList();
    if (keys.isEmpty) {
      return 0;
    }
    return keys.reduce((value, element) => value > element ? value : element) +
        1;
  }

  Future<int> set(ServerConfig config) async {
    final box = Hive.box("servers");
    final key = switch (config.id) {
      int() => config.id,
      _ => _generateKey(),
    };
    await box.put(key, config.copyWith(id: key).toMap());
    state = fetch();
    return key!;
  }

  Future<void> remove(ServerConfig config) async {
    final box = Hive.box("servers");
    await box.delete(config.id);
    state = fetch();
  }
}
