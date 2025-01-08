// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:quickshift/models/backends/torrent_client_type.dart';
import 'package:quickshift/models/backends/transmission/transmission_server_config.dart';

abstract interface class ServerConfig {
  abstract final String name;
  abstract final String host;
  abstract final int port;
  abstract final String path;
  abstract final String? username;
  abstract final String? password;
  abstract final bool https;
  abstract final TorrentClientType clientType;
  Map<String, dynamic> toMap();
  ServerConfig copyWith({
    String? name,
    String? host,
    int? port,
    String? path,
    String? username,
    String? password,
    bool? https,
  });

  factory ServerConfig.fromMap(Map<String, dynamic> map) {
    switch (TorrentClientType.fromString(map['clientType'])) {
      case TorrentClientType.transmission:
        return TransmissionServerConfig.fromMap(map);
      case TorrentClientType.qbittorrent:
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }
}
