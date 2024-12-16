class InvalidTransmissionSessionId implements Exception {
  final String cause;

  InvalidTransmissionSessionId(
      [this.cause = "Invalid Transmission Session ID. Try to reconnect."]);

  @override
  String toString() {
    return cause;
  }
}
