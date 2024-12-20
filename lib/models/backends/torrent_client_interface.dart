import 'package:quickshift/models/backends/torrent_client_type.dart';
import 'package:quickshift/models/backends/transmission/transmission_client.dart';
import 'package:quickshift/models/backends/transmission/transmission_server_config.dart';
import 'package:quickshift/models/backends/unconnected_torrent_client.dart';
import 'package:quickshift/models/server.dart';
import 'package:quickshift/models/torrent/torrent_data.dart';

abstract interface class TorrentClient {
  abstract final ServerConfig config;
  TorrentClientStatus get clientStatus;
  TorrentClient updateClientStatus(TorrentClientStatus value);
  String? get name;

  Future<TorrentClient> init();

  Future<List<TorrentData>> getTorrents();
  Future<TorrentData> addTorrentFromMagnet(String link);
  Future<void> removeTorrents(List<TorrentData> torrent,
      {required bool deleteLocalData});
  Future<void> stopTorrents(List<TorrentData> torrent);
  Future<void> verifyTorrents(List<TorrentData> torrent);
  Future<void> forceStartTorrents(List<TorrentData> torrent);
  Future<void> startTorrents(List<TorrentData> torrent);

  static TorrentClient fromConfig(ServerConfig? config) {
    switch (config?.clientType) {
      case TorrentClientType.transmission:
        return TransmissionClient(config as TransmissionServerConfig,
            clientStatus: const TorrentClientStatusConfigured());
      case null:
        return UnconfiguredTorrentClient();
      default:
        throw UnimplementedError();
    }
  }

  @override
  bool operator ==(covariant TorrentClient other) {
    if (identical(this, other)) return true;

    return other.config == config && other.clientStatus == clientStatus;
  }

  @override
  int get hashCode => config.hashCode ^ clientStatus.hashCode;
}

sealed class TorrentClientStatus {}

final class TorrentClientStatusUnconfigured implements TorrentClientStatus {
  const TorrentClientStatusUnconfigured();
  @override
  String toString() => "Unconfigured";
}

final class TorrentClientStatusConfigured implements TorrentClientStatus {
  const TorrentClientStatusConfigured();

  @override
  String toString() => "Configured";
}

final class TorrentClientStatusInitialized implements TorrentClientStatus {
  const TorrentClientStatusInitialized();

  @override
  String toString() => "Initialized";
}

final class TorrentClientStatusError implements TorrentClientStatus {
  final String message;
  const TorrentClientStatusError(this.message);

  @override
  String toString() => message;
}

final class TorrentClientStatusLoading implements TorrentClientStatus {
  const TorrentClientStatusLoading();

  @override
  String toString() => "Loading";
}
