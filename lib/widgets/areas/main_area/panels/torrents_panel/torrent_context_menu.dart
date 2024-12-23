import 'package:flutter/material.dart';
import 'package:flutter_context_menu/flutter_context_menu.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quickshift/models/torrent/torrent_data.dart';

ContextMenu buildTorrentContextMenu(TorrentData torrent,
    {required VoidCallback onStop,
    required VoidCallback onRemove,
    required VoidCallback onRemoveWithLocalData,
    required VoidCallback onVerify,
    required VoidCallback onForceStart,
    required VoidCallback onStart,
    required VoidCallback onReannounce, // Add this parameter
    Offset? positon,
    required ColorScheme colorScheme}) {
  return ContextMenu(
      entries: [
        const MenuHeader(text: "Torrent"),
        MenuItem(
          icon: FontAwesomeIcons.play,
          label: 'Start',
          onSelected: onStart,
        ),
        MenuItem(
          icon: FontAwesomeIcons.play,
          label: 'Force Start',
          onSelected: onForceStart,
        ),
        MenuItem(
          icon: FontAwesomeIcons.stop,
          label: 'Stop',
          onSelected: onStop,
        ),
        MenuItem(
          icon: FontAwesomeIcons.minus,
          label: 'Remove',
          onSelected: onRemove,
        ),
        MenuItem(
          icon: FontAwesomeIcons.trash,
          label: 'Remove (with local data)',
          onSelected: onRemoveWithLocalData,
        ),
        MenuItem(
          icon: FontAwesomeIcons.check,
          label: 'Verify',
          onSelected: onVerify,
        ),
        MenuItem(
          icon: FontAwesomeIcons.arrowsRotate,
          label: 'Reannounce', // Add this item
          onSelected: onReannounce,
        )
      ],
      position: positon,
      boxDecoration: BoxDecoration(
          color: colorScheme.surface, borderRadius: BorderRadius.circular(4)));
}
