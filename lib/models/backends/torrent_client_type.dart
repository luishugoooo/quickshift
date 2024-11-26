import 'package:flutter/widgets.dart';
import 'package:quickshift/widgets/icons/qbittorrent_icon.dart';
import 'package:quickshift/widgets/icons/transmission_icon.dart';

enum TorrentClientType {
  qbittorrent(QbittorrentIcon()),
  transmission(TransmissionIcon());

  final Widget icon;

  const TorrentClientType(this.icon);
}
