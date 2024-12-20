import 'package:quickshift/models/backends/torrent_client_interface.dart';

class UnconfiguredTorrentClient implements TorrentClient {
  @override
  String get name => "Not connected";

  @override
  TorrentClientStatus get clientStatus =>
      const TorrentClientStatusUnconfigured();

  @override
  dynamic noSuchMethod(Invocation invocation) => throw UnsupportedError(
      "Unconfigured client does not support the method ${invocation.memberName}");
}
