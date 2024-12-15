import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:quickshift/models/backends/torrent_client_interface.dart"
    as client;
import 'package:quickshift/models/backends/torrent_client_interface.dart';
import 'package:quickshift/models/backends/torrent_client_type.dart';
import 'package:quickshift/models/backends/transmission/transmission_client.dart';
import 'package:quickshift/models/backends/transmission/transmission_server_config.dart';
import 'package:quickshift/models/backends/unconnected_torrent_client.dart';
import 'package:quickshift/models/server.dart';
import 'package:quickshift/state/tabs.dart';
import 'package:quickshift/widgets/util/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'torrent_client_provider.g.dart';

@Riverpod(keepAlive: true)
class TorrentClients extends _$TorrentClients {
  @override
  client.TorrentClient build(ServerConfig? c) {
    return switch (c?.clientType) {
      TorrentClientType.qbittorrent => throw UnimplementedError(),
      TorrentClientType.transmission =>
        TransmissionClient(c as TransmissionServerConfig),
      null => UnconfiguredTorrentClient(),
    };
  }

  Future<void> init() async {
    ref.read(loggingProvider.notifier).addLog("initing client");
    state = await state.init();
    ref.read(loggingProvider.notifier).addLog("inited client");
  }
}

@riverpod
TorrentClient currentClient(Ref ref) {
  final c = ref.watch(currentTabProvider.select(
    (value) => value.config,
  ));

  final client = ref.watch(torrentClientsProvider(c));
  print("currentClient $client");
  return client;
}
