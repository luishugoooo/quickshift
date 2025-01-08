// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:quickshift/models/backends/torrent_client_type.dart';

class ServerConfig {
  final int? id;
  final String name;
  final String host;
  final int port;
  final String path;
  final String? username;
  final String? password;
  final bool https;
  final TorrentClientType? clientType;

  ServerConfig({
    this.id,
    required this.name,
    required this.host,
    required this.port,
    required this.path,
    this.username,
    this.password,
    required this.https,
    this.clientType,
  });

  ServerConfig.empty()
      : id = null,
        name = '',
        host = '',
        port = 0,
        path = '',
        username = '',
        password = '',
        https = false,
        clientType = null;

  ServerConfig.transmission(
      {required this.name,
      required this.host,
      this.port = 9091,
      this.path = "/transmission/rpc",
      this.https = false,
      this.username,
      this.password})
      : clientType = TorrentClientType.transmission,
        id = null;

  ServerConfig copyWith({
    int? id,
    String? name,
    String? host,
    int? port,
    String? path,
    String? username,
    String? password,
    bool? https,
    TorrentClientType? clientType,
  }) {
    return ServerConfig(
      id: id ?? this.id,
      name: name ?? this.name,
      host: host ?? this.host,
      port: port ?? this.port,
      path: path ?? this.path,
      username: username ?? this.username,
      password: password ?? this.password,
      https: https ?? this.https,
      clientType: clientType ?? this.clientType,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'host': host,
      'port': port,
      'path': path,
      'username': username,
      'password': password,
      'https': https,
      'clientType': clientType?.toString(),
    };
  }

  factory ServerConfig.fromMap(Map<dynamic, dynamic> map) {
    return ServerConfig(
        id: map['id'],
        name: map['name'],
        host: map['host'],
        port: map['port'],
        path: map['path'],
        username: map['username'],
        password: map['password'],
        https: map['https'],
        clientType: map['clientType'] != null
            ? TorrentClientType.fromString(map['clientType'])
            : null);
  }

  String toJson() => json.encode(toMap());

  factory ServerConfig.fromJson(String source) =>
      ServerConfig.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ServerConfig(name: $name, host: $host, port: $port, path: $path, username: $username, password: $password, https: $https, clientType: $clientType)';
  }
}
