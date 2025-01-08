import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:quickshift/extensions/theme.dart';

class CustomWindowButton extends StatelessWidget {
  final Color? mouseOverColor;
  final VoidCallback onPress;
  final Widget icon;
  const CustomWindowButton(
      {super.key,
      this.mouseOverColor,
      required this.onPress,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: WindowButton(
          onPressed: onPress,
          colors: WindowButtonColors(
              mouseOver: mouseOverColor ??
                  context.theme.colorScheme.primary
                      .withAlpha((0.3 * 255).toInt())),
          iconBuilder: (buttonContext) => icon),
    );
  }
}
