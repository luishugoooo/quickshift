// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:quickshift/models/backends/torrent_client_type.dart';
import 'package:quickshift/models/server.dart';

class TransmissionServerConfig implements ServerConfig {
  @override
  final String name;
  @override
  final String host;
  @override
  final int port;
  @override
  final String path;
  @override
  final String? username;
  @override
  final String? password;
  @override
  final bool https;
  @override
  final TorrentClientType clientType = TorrentClientType.transmission;

  final String? sessionId;

  const TransmissionServerConfig({
    required this.name,
    required this.host,
    this.port = 9091,
    this.path = "/transmission/rpc",
    this.username,
    this.password,
    this.https = false,
    this.sessionId,
  });

  TransmissionServerConfig copyWith({
    String? name,
    String? host,
    int? port,
    String? path,
    String? username,
    String? password,
    bool? https,
    String? sessionId,
  }) {
    return TransmissionServerConfig(
      name: name ?? this.name,
      host: host ?? this.host,
      port: port ?? this.port,
      path: path ?? this.path,
      username: username ?? this.username,
      password: password ?? this.password,
      https: https ?? this.https,
      sessionId: sessionId ?? this.sessionId,
    );
  }
}
