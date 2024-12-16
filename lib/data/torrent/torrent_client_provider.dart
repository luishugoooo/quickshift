import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:quickshift/models/backends/torrent_client_interface.dart"
    as client;
import 'package:quickshift/models/backends/torrent_client_interface.dart';
import 'package:quickshift/models/server.dart';
import 'package:quickshift/state/tabs.dart';
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
    state = await state.init().catchError((error) =>
        state.updateClientStatus(TorrentClientStatusError(error.toString())));
    ref.read(loggingProvider.notifier).log("inited client");
  }
}

@riverpod
TorrentClient currentClient(Ref ref) {
  final c = ref.watch(currentTabProvider.select(
    (value) => value.config,
  ));

  final client = ref.watch(torrentClientsProvider(c));
  return client;
}
