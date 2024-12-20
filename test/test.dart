

/* void main() {
  group("Transmission", () {
    test(
      "initClient",
      () async {
        final config = MOCK_SERVERS[0] as TransmissionServerConfig;
        final sessionId = await init(config);
        expect(sessionId, isA<String>());
        var torrents = await getTorrents(
            config: config,
            sessionId: sessionId,
            fields: [
              TransmissionTorrentField.name,
              TransmissionTorrentField.status
            ]);
      },
    );
  });
}
 */