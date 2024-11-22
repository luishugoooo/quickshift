import 'package:quickshift/models/backends/torrent_client_interface.dart';

class Server {
  final int? id;
  final String name;
  final String host;
  final String username;
  final String password;
  final TorrentClientType clientType;
  const Server(
      {this.id,
      required this.name,
      required this.host,
      required this.username,
      required this.password,
      required this.clientType});
}
