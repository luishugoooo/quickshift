import 'package:flutter/material.dart';
import 'package:quickshift/models/torrent/torrent_data.dart';

class TorrentRow extends StatelessWidget {
  final TorrentData torrent;
  final bool alternateColor;
  const TorrentRow(
      {super.key, required this.alternateColor, required this.torrent});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      color: alternateColor
          ? colorScheme.primaryContainer.withOpacity(0.1)
          : colorScheme.primary.withOpacity(0.1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              torrent.name,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: LinearProgressIndicator(
              value: torrent.progress,
              minHeight: 8,
              borderRadius: BorderRadius.circular(2),
              backgroundColor: colorScheme.primary.withOpacity(0.5),
              valueColor: AlwaysStoppedAnimation<Color>(colorScheme.primary),
            ),
          ),
          Expanded(child: Text("${torrent.size / 1000 / 1000} MB")),
        ],
      ),
    );
  }
}
