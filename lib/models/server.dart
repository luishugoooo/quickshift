// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Server {
  final int? id;
  final String name;
  final String host;
  final String username;
  final String password;
  const Server({
    this.id,
    required this.name,
    required this.host,
    required this.username,
    required this.password,
  });

  Server copyWith({
    int? id,
    String? name,
    String? host,
    String? username,
    String? password,
  }) {
    return Server(
      id: id ?? this.id,
      name: name ?? this.name,
      host: host ?? this.host,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'host': host,
      'username': username,
      'password': password,
    };
  }

  factory Server.fromMap(Map<String, dynamic> map) {
    return Server(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] as String,
      host: map['host'] as String,
      username: map['username'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Server.fromJson(String source) =>
      Server.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Server(id: $id, name: $name, host: $host, username: $username, password: $password)';
  }

  @override
  bool operator ==(covariant Server other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.host == host &&
        other.username == username &&
        other.password == password;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        host.hashCode ^
        username.hashCode ^
        password.hashCode;
  }
}
