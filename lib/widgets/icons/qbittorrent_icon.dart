import 'package:flutter/material.dart';

class QbittorrentIcon extends StatelessWidget {
  const QbittorrentIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/icons/qbittorrent.png",
      fit: BoxFit.contain,
    );
  }
}
