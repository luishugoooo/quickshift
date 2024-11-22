import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quickshift/models/backends/torrent_client_interface.dart';
import 'package:quickshift/models/backends/transmission/transmission_client.dart';
import 'package:quickshift/models/torrent/torrent_data.dart';
import 'package:quickshift/state/tabs.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'torrent_client_provider.g.dart';

@Riverpod(keepAlive: true)
class TorrentClient extends _$TorrentClient {
  @override
  FutureOr<TorrentClientInterface?> build(Tab tab) async {
    switch (tab.server?.clientType) {
      case null:
        return null;
      case TorrentClientType.transmission:
        return await TransmissionClient.create(
            host: tab.server!.host,
            username: tab.server!.username,
            password: tab.server!.password);
    }
  }
}

@Riverpod(keepAlive: true)
FutureOr<List<TorrentData>?> torrents(Ref ref) {
  final tab = ref.watch(currentTabProvider);
  final client = ref
      .watch(torrentClientProvider(tab))
      .whenData(
        (value) => value,
      )
      .value;
  if (client == null) {
    print("client is null");
    return null;
  }
  print("client: $client");
  return client.getTorrents();
}
