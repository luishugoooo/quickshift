import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:super_context_menu/super_context_menu.dart';

class TorrentContextMenu extends StatelessWidget {
  final Widget child;
  final VoidCallback onStop;
  final VoidCallback onRemove;
  final VoidCallback onRemoveWithLocalData;
  final VoidCallback onVerify;
  final VoidCallback onForceStart;
  final VoidCallback onStart;
  final VoidCallback onReannounce;
  const TorrentContextMenu(
      {super.key,
      required this.child,
      required this.onStop,
      required this.onRemove,
      required this.onRemoveWithLocalData,
      required this.onVerify,
      required this.onForceStart,
      required this.onStart,
      required this.onReannounce});

  @override
  Widget build(BuildContext context) {
    return ContextMenuWidget(
      child: child,
      menuProvider: (_) {
        return Menu(
          children: [
            MenuAction(
                title: "Start",
                callback: onStart,
                image: MenuImage.icon(_DynamicMenuIcon.play.getIcon())),
            MenuAction(
                title: "Force Start",
                callback: onForceStart,
                image: MenuImage.icon(_DynamicMenuIcon.play_alt.getIcon())),
            MenuAction(
                title: "Stop",
                callback: onStop,
                image: MenuImage.icon(_DynamicMenuIcon.stop.getIcon())),
            MenuAction(
                title: "Remove",
                callback: onRemove,
                image: MenuImage.icon(_DynamicMenuIcon.remove.getIcon())),
            MenuAction(
                title: "Remove with Local Data",
                callback: onRemoveWithLocalData,
                image: MenuImage.icon(
                    _DynamicMenuIcon.removeWithLocalData.getIcon())),
            MenuAction(
                title: "Verify",
                callback: onVerify,
                image: MenuImage.icon(_DynamicMenuIcon.verify.getIcon())),
            MenuAction(
                title: "Reannounce",
                callback: onReannounce,
                image: MenuImage.icon(_DynamicMenuIcon.reannounce.getIcon())),
          ],
        );
      },
    );
  }
}

enum _DynamicMenuIcon {
  play,
  play_alt,
  stop,
  remove,
  removeWithLocalData,
  verify,
  reannounce;

  IconData getIcon() {
    if (Platform.isMacOS) {
      return _macosIcons[this]!;
    } else {
      return _faIcons[this]!;
    }
  }
}

const Map<_DynamicMenuIcon, IconData> _faIcons = {
  _DynamicMenuIcon.play: Icons.play_arrow,
  _DynamicMenuIcon.play_alt: Icons.play_circle_fill,
  _DynamicMenuIcon.stop: Icons.stop,
  _DynamicMenuIcon.remove: Icons.delete,
  _DynamicMenuIcon.removeWithLocalData: Icons.delete_forever,
  _DynamicMenuIcon.verify: Icons.check,
  _DynamicMenuIcon.reannounce: Icons.refresh,
};

const Map<_DynamicMenuIcon, IconData> _macosIcons = {
  _DynamicMenuIcon.play: CupertinoIcons.play,
  _DynamicMenuIcon.play_alt: CupertinoIcons.play_fill,
  _DynamicMenuIcon.stop: CupertinoIcons.stop_fill,
  _DynamicMenuIcon.remove: CupertinoIcons.delete,
  _DynamicMenuIcon.removeWithLocalData: CupertinoIcons.delete_solid,
  _DynamicMenuIcon.verify: CupertinoIcons.check_mark_circled_solid,
  _DynamicMenuIcon.reannounce: CupertinoIcons.refresh,
};
