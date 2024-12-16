import 'package:flutter_test/flutter_test.dart';
import 'package:quickshift/const/consts.dart';
import 'package:quickshift/models/backends/transmission/lib.dart';
import 'package:quickshift/models/backends/transmission/raw_transmission_torrent_data.dart';
import 'package:quickshift/models/backends/transmission/transmission_server_config.dart';

void main() {
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
