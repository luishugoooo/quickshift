class ClientNotInitalized implements Exception {
  final String cause;

  ClientNotInitalized(
      [this.cause =
          "An api call was made without the client being initialized."]);

  @override
  String toString() {
    return cause;
  }
}
