// ignore_for_file: public_member_api_docs, sort_constructors_first
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

  @override
  bool operator ==(covariant Server other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.host == host &&
        other.username == username &&
        other.password == password &&
        other.clientType == clientType;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        host.hashCode ^
        username.hashCode ^
        password.hashCode ^
        clientType.hashCode;
  }
}
