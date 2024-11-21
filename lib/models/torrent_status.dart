import 'package:dart_transmission_rpc/utils.dart' as transmission_utils;
import 'package:quickshift/icons/dynamic_icons.dart';

enum TorrentStatus {
  all('All', DynamicIcons.list),
  stopped('Stopped', DynamicIcons.stop),
  verifying('Verifying', DynamicIcons.verify),
  downloading('Downloading', DynamicIcons.download),
  seeding('Seeding', DynamicIcons.seeding);

  final String label;
  final DynamicIcons icon;

  const TorrentStatus(this.label, this.icon);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'label': label,
      'icon': icon.toString(),
    };
  }

  factory TorrentStatus.fromTransmissionStatus(
      transmission_utils.TorrentStatus status) {
    switch (status) {
      case transmission_utils.TorrentStatus.unknown:
        return TorrentStatus.all;
      case transmission_utils.TorrentStatus.stopped:
        return TorrentStatus.stopped;
      case transmission_utils.TorrentStatus.queuedToVerify:
      case transmission_utils.TorrentStatus.verifyLocalData:
        return TorrentStatus.verifying;
      case transmission_utils.TorrentStatus.queuedToDownload:
      case transmission_utils.TorrentStatus.downloading:
        return TorrentStatus.downloading;
      case transmission_utils.TorrentStatus.queuedToSeed:
      case transmission_utils.TorrentStatus.seeding:
        return TorrentStatus.seeding;
      default:
        throw Exception('Invalid TransmissionStatus');
    }
  }

  factory TorrentStatus.fromMap(Map<String, dynamic> map) {
    switch (map['label'] as String) {
      case 'All':
        return TorrentStatus.all;
      case 'Stopped':
        return TorrentStatus.stopped;
      case 'Verifying':
        return TorrentStatus.verifying;
      case 'Downloading':
        return TorrentStatus.downloading;
      case 'Seeding':
        return TorrentStatus.seeding;
      default:
        throw Exception('Invalid TorrentStatus');
    }
  }
}
