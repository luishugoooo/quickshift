// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:quickshift/models/backends/server_config.dart';
import 'package:quickshift/models/backends/torrent_client_type.dart';

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

  const TransmissionServerConfig({
    required this.name,
    required this.host,
    this.port = 9091,
    this.path = "/transmission/rpc",
    this.username,
    this.password,
    this.https = false,
  });

  @override
  TransmissionServerConfig copyWith({
    String? name,
    String? host,
    int? port,
    String? path,
    String? username,
    String? password,
    bool? https,
  }) {
    return TransmissionServerConfig(
      name: name ?? this.name,
      host: host ?? this.host,
      port: port ?? this.port,
      path: path ?? this.path,
      username: username ?? this.username,
      password: password ?? this.password,
      https: https ?? this.https,
    );
  }

  @override
  bool operator ==(covariant TransmissionServerConfig other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.host == host &&
        other.port == port &&
        other.path == path &&
        other.username == username &&
        other.password == password &&
        other.https == https;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        host.hashCode ^
        port.hashCode ^
        path.hashCode ^
        username.hashCode ^
        password.hashCode ^
        https.hashCode;
  }

  @override
  String toString() {
    return 'TransmissionServerConfig(name: $name, host: $host, port: $port, path: $path, username: $username, password: $password, https: $https)';
  }

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'host': host,
      'port': port,
      'path': path,
      'username': username,
      'password': password,
      'https': https,
      'clientType': clientType.toString(),
    };
  }

  factory TransmissionServerConfig.fromMap(Map<String, dynamic> map) {
    return TransmissionServerConfig(
      name: map['name'] as String,
      host: map['host'] as String,
      port: map['port'] as int,
      path: map['path'] as String,
      username: map['username'] != null ? map['username'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      https: map['https'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory TransmissionServerConfig.fromJson(String source) =>
      TransmissionServerConfig.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
