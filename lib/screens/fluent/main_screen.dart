import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quickshift/extensions/theme.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = context.theme;
    return Scaffold(
      body: Column(
        children: [
          WindowTitleBarBox(
            child: Row(
              children: [
                Expanded(child: MoveWindow()),
                WindowButton(
                  onPressed: appWindow.minimize,
                  iconBuilder: (buttonContext) => MinimizeIcon(
                    color: theme.colorScheme.secondary,
                  ),
                ),
                WindowButton(
                  onPressed: appWindow.maximize,
                  iconBuilder: (buttonContext) =>
                      MaximizeIcon(color: theme.colorScheme.secondary),
                ),
                WindowButton(
                  onPressed: appWindow.close,
                  colors: WindowButtonColors(mouseOver: Colors.red),
                  iconBuilder: (buttonContext) =>
                      CloseIcon(color: theme.colorScheme.secondary),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
