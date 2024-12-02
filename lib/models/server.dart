// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:quickshift/models/backends/torrent_client_type.dart';

abstract interface class ServerConfig {
  abstract final String name;
  abstract final String host;
  abstract final int port;
  abstract final String path;
  abstract final String? username;
  abstract final String? password;
  abstract final bool https;
  abstract final TorrentClientType clientType;
}
