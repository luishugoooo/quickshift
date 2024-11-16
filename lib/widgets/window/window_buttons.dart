import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:quickshift/extensions/theme.dart';
import 'package:quickshift/widgets/window/custom_window_button.dart';

class WindowButtons extends StatelessWidget {
  const WindowButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Row(
      children: [
        CustomWindowButton(
          icon: MinimizeIcon(
            color: theme.colorScheme.secondary,
          ),
          onPress: appWindow.minimize,
        ),
        CustomWindowButton(
          icon: MaximizeIcon(
            color: theme.colorScheme.secondary,
          ),
          onPress: appWindow.maximizeOrRestore,
        ),
        CustomWindowButton(
          icon: CloseIcon(
            color: theme.colorScheme.secondary,
          ),
          onPress: appWindow.close,
          mouseOverColor: Colors.red,
        ),
      ],
    );
  }
}
