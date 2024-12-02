/* @Riverpod(keepAlive: true)
class TorrentClient extends _$TorrentClient {
  // Null IS a valid state if no server is provided yet
  // (Just in case I try stupid things again)
  @override
  List<TorrentClientInterface?> build() {
    print("REBUILDING CLIENT");
    return ref.watch(tabsProvider).map(
      (e) {
        switch (e.server?.clientType) {
          case TorrentClientType.transmission:
            return TransmissionClient(
              host: e.server!.host,
              username: e.server!.username,
              password: e.server!.password,
            );
          case null:
            break;
          case TorrentClientType.qbittorrent:
            throw UnimplementedError();
        }
      },
    ).toList();
  }

  Future<void> initClient(int tabId) async {
    state = [for ];
  }
} */

/* import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quickshift/exceptions/torrent/client_not_initalized.dart';
import 'package:quickshift/models/torrent/torrent_data.dart';
import 'package:quickshift/state/tabs.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'torrent_client_provider.g.dart';

@Riverpod(keepAlive: true)
FutureOr<List<TorrentData>> torrents(Ref ref, int tabId) async {
  final client = ref.watch(currentTabProvider).client;
  if (client == null) {
    throw ClientNotInitalized();
  }
  final res = await (client.getTorrents());
  return res;
}
 */