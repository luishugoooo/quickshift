import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quickshift/exceptions/torrent/client_not_initalized.dart';
import 'package:quickshift/exceptions/torrent/no_server_provided.dart';
import 'package:quickshift/models/backends/torrent_client_interface.dart';
import 'package:quickshift/models/backends/torrent_client_type.dart';
import 'package:quickshift/models/backends/transmission/transmission_client.dart';
import 'package:quickshift/models/torrent/torrent_data.dart';
import 'package:quickshift/state/tabs.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'torrent_client_provider.g.dart';

@Riverpod(keepAlive: true)
class TorrentClient extends _$TorrentClient {
  // Null IS a valid state if no server is provided yet
  // (Just in case I try stupid things again)
  @override
  TorrentClientInterface? build(Tab tab) {
    switch (tab.server?.clientType) {
      case null:
        null;
      case TorrentClientType.transmission:
        return TransmissionClient(
            host: tab.server!.host,
            password: tab.server!.password,
            username: tab.server!.username);
      case TorrentClientType.qbittorrent:
      // TODO: Handle this case.
    }
    return null;
  }

  Future<void> init() async {
    if (state == null) {
    throw NoServerProvidedException();
    }
    await state!.init();
    state = state!.copyWith();
  }
}

@Riverpod(keepAlive: true)
FutureOr<List<TorrentData>> torrents(Ref ref, Tab tab) async {
  final client = ref.watch(torrentClientProvider(tab));

  if (client == null) {
    throw ClientNotInitalized();
  }
  final res = await client.getTorrents();
  return res;
}
