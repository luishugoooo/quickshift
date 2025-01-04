import 'package:quickshift/data/torrent/current_server_config_provider.dart';
import "package:quickshift/models/backends/torrent_client_interface.dart"
    as client;
import 'package:quickshift/models/backends/torrent_client_interface.dart';
import 'package:quickshift/models/backends/server_config.dart';
import 'package:quickshift/widgets/util/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'torrent_client_provider.g.dart';

@Riverpod(keepAlive: true)
class TorrentClients extends _$TorrentClients {
  @override
  client.TorrentClient build(ServerConfig? c) {
    return TorrentClient.fromConfig(c);
  }

  Future<void> init() async {
    if (state.clientStatus is TorrentClientStatusInitialized) {
      ref.invalidateSelf();
    }
    state = state.updateClientStatus(const TorrentClientStatusLoading());
    ref.read(loggingProvider.notifier).log("initing client");
    state = await state
        .init()
        .catchError((error) => state
            .updateClientStatus(TorrentClientStatusError(error.toString())))
        .timeout(
          const Duration(seconds: 5),
          onTimeout: () => state.updateClientStatus(TorrentClientStatusError(
              "Timeout while trying to connect to ${c?.host}")),
        );
    ref.read(loggingProvider.notifier).log("inited client");
  }

  Future<void> disconnect() async {
    ref.invalidateSelf();
  }
}

@riverpod
class CurrentClient extends _$CurrentClient {
  @override
  TorrentClient build() {
    final c = ref.watch(currentServerConfigProvider);

    final client = ref.watch(torrentClientsProvider(c));
    return client;
  }

  Future<void> init() async {
    final client = ref.read(
        torrentClientsProvider(ref.read(currentServerConfigProvider)).notifier);
    await client.init();
  }

  Future<void> disconnect() async {
    final client = ref.read(
        torrentClientsProvider(ref.read(currentServerConfigProvider)).notifier);
    await client.disconnect();
  }
}
