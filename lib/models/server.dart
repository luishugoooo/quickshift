// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:quickshift/models/backends/torrent_client_type.dart';

abstract class ServerConfig {
  final String name;
  final String host;
  final int port;
  final String path;
  final String? username;
  final String? password;
  final bool https;

  const ServerConfig(
      {required this.name,
      required this.host,
      required this.port,
      required this.path,
      this.username,
      this.password,
      required this.https,
});
}
