import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quickshift/data/database/settings/settings_notifier.dart';
import 'package:quickshift/widgets/dialog/settings_dialog.dart';

class OsMenuBar extends ConsumerWidget {
  final Widget child;
  const OsMenuBar({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!Platform.isMacOS) {
      return child;
    } else {
      return PlatformMenuBar(
        menus: [
          PlatformMenu(label: "Quickshift", menus: [
            PlatformMenuItemGroup(members: [
              PlatformMenuItem(
                //TODO: Add proper about dialog
                label: "About Quickshift",
                onSelected: () => showAboutDialog(context: context),
              ),
            ]),
            PlatformMenuItem(
              label: "Settings",
              shortcut:
                  const SingleActivator(LogicalKeyboardKey.comma, meta: true),
              onSelected: () {
                if (Navigator.of(context).canPop()) {
                  return;
                }
                showDialog(
                  context: context,
                  builder: (context) =>
                      SettingsDialog(settings: ref.watch(settingsProvider)),
                );
              },
            )
          ])
        ],
        child: child,
      );
    }
  }
}
