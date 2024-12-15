import "package:quickshift/models/backends/torrent_client_interface.dart"
    as client;
import 'package:quickshift/models/backends/torrent_client_type.dart';
import 'package:quickshift/models/backends/transmission/transmission_client.dart';
import 'package:quickshift/models/backends/transmission/transmission_server_config.dart';
import 'package:quickshift/models/server.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'torrent_client_provider.g.dart';

@Riverpod(keepAlive: true)
class TorrentClient extends _$TorrentClient {
  @override
  client.TorrentClient build(ServerConfig c) {
    return switch (c.clientType) {
      TorrentClientType.qbittorrent => throw UnimplementedError(),
      TorrentClientType.transmission =>
        TransmissionClient(c as TransmissionServerConfig),
    };
  }

  Future<void> init() async {
    if (state.isInit) return;
    state = await state.init();
  }
}
