class NoServerProvidedException implements Exception {
  final String cause;

  NoServerProvidedException(
      [this.cause = "A client provider was initialized without a server."]);

  @override
  String toString() {
    return cause;
  }
}
