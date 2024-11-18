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
