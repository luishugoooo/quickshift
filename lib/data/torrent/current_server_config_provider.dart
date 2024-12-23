import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quickshift/models/server.dart';
import 'package:quickshift/data/state/tabs.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_server_config_provider.g.dart';

@riverpod
ServerConfig? currentServerConfig(Ref ref) {
  return ref.watch(currentTabProvider.select(
    (value) => value.config,
  ));
}
