import 'package:quickshift/models/backends/torrent_client_type.dart';
import 'package:quickshift/models/server.dart';

class TransmissionServerConfig extends ServerConfig {
  final String? sessionId;
  const TransmissionServerConfig(
      {required super.name,
      required super.host,
      super.username,
      super.password,
      super.port = 9091,
      super.path = "/transmission/rpc",
      required super.https,
      this.sessionId});

  TransmissionServerConfig copyWith({
    String? name,
    String? host,
    int? port,
    String? path,
    String? username,
    String? password,
    bool? https,
    TorrentClientType? clientType,
    String? sessionId,
  }) {
    return TransmissionServerConfig(
      name: name ?? super.name,
      host: host ?? super.host,
      port: port ?? super.port,
      path: path ?? super.path,
      username: username ?? super.username,
      password: password ?? super.password,
      https: https ?? super.https,
      sessionId: sessionId ?? this.sessionId,
    );
  }
}
