class ClientInitTimeout implements Exception {
  final String message;
  const ClientInitTimeout([this.message = "Client initialization timed out"]);
  @override
  String toString() => message;
}
