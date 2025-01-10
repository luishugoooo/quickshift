class ClientConnectionException implements Exception {
  final String message;

  ClientConnectionException(this.message);

  @override
  String toString() {
    return message;
  }
}
