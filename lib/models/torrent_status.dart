import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum TorrentStatus {
  all('All', FontAwesomeIcons.list),
  stopped('Stopped', FontAwesomeIcons.stop),
  verifying('Verifying', FontAwesomeIcons.fingerprint),
  downloading('Downloading', FontAwesomeIcons.download),
  seeding('Seeding', FontAwesomeIcons.upload);

  final String label;
  final IconData icon;

  const TorrentStatus(this.label, this.icon);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'label': label,
      'icon': icon.toString(),
    };
  }

  factory TorrentStatus.fromTransmissionStatus(int status) {
    return switch (status) {
      0 => TorrentStatus.stopped,
      1 || 2 => TorrentStatus.verifying,
      3 || 4 => TorrentStatus.downloading,
      5 || 6 => TorrentStatus.seeding,
      _ => TorrentStatus.all
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
