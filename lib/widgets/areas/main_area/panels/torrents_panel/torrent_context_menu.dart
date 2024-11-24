import 'package:flutter/material.dart';
import 'package:flutter_context_menu/flutter_context_menu.dart';
import 'package:quickshift/models/torrent/torrent_data.dart';

ContextMenu buildTorrentContextMenu(TorrentData torrent,
    {required VoidCallback onStop,
    Offset? positon,
    required ColorScheme colorScheme}) {
  return ContextMenu(
      entries: [
        const MenuHeader(text: "Torrent"),
        MenuItem(
          label: 'Stop',
          onSelected: onStop,

        ),
      ],
      position: positon,
      boxDecoration: BoxDecoration(
          color: colorScheme.surface, borderRadius: BorderRadius.circular(4)));
}
