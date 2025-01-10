import 'package:flutter/widgets.dart';
import 'package:quickshift/widgets/icons/qbittorrent_icon.dart';
import 'package:quickshift/widgets/icons/transmission_icon.dart';

enum TorrentClientType {
  qbittorrent(QbittorrentIcon()),
  transmission(TransmissionIcon());

  final Widget icon;

  const TorrentClientType(this.icon);

  factory TorrentClientType.fromString(String type) {
    switch (type.toLowerCase()) {
      case 'qbittorrent':
        return TorrentClientType.qbittorrent;
      case 'transmission':
        return TorrentClientType.transmission;
      default:
        throw ArgumentError('Unknown TorrentClientType: $type');
    }
  }

  @override
  String toString() {
    switch (this) {
      case TorrentClientType.qbittorrent:
        return 'qBittorrent';
      case TorrentClientType.transmission:
        return 'Transmission';
    }
  }
}
