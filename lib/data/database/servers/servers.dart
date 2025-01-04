import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:quickshift/models/backends/server_config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'servers.g.dart';

@riverpod
class StoredServers extends _$StoredServers {
  @override
  List<ServerConfig> build() {
    fetch();
    return [];
  }

  Future<void> fetch() async {
    final box = Hive.box("servers");
    final servers = box.values.map((e) => ServerConfig.fromMap(e)).toList();
    state = servers;
  }

  Future<void> add(ServerConfig config) async {
    final box = Hive.box("servers");
    if (box.containsKey(config.name)) {
      throw "Server with name ${config.name} already exists";
    }
    await box.put(config.name, config.toMap());
    await fetch();
  }

  Future<void> remove(ServerConfig config) async {
    final box = Hive.box("servers");
    await box.delete(config.name);
    await fetch();
  }
}
