import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ToolbarIconButton extends StatelessWidget {
  final IconData icon;
  final String? tooltip;
  final VoidCallback? onPressed;

  const ToolbarIconButton(
      {super.key, required this.icon, this.tooltip, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip ?? "",
      waitDuration: const Duration(milliseconds: 600),
      child: IconButton(
        visualDensity: const VisualDensity(horizontal: -2, vertical: -2),
        onPressed: onPressed,
        iconSize: 18,
        icon: FaIcon(
          icon,
        ),
      ),
    );
  }
}
