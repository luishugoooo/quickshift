import 'package:flutter/material.dart';

class DefaultElevatedButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final TextStyle? textStyle;
  final ButtonStyle? style;

  const DefaultElevatedButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.textStyle,
      this.style});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ElevatedButton(
      onPressed: onPressed,
      style: style?.merge(ElevatedButton.styleFrom(
              backgroundColor: colorScheme.primary,
              overlayColor: colorScheme.surface,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)))) ??
          ElevatedButton.styleFrom(
              backgroundColor: colorScheme.primary,
              overlayColor: colorScheme.surface,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6))),
      child: Text(
        text,
        style: TextStyle(
                color: (onPressed != null) ? colorScheme.onPrimary : null,
                fontWeight: FontWeight.w500)
            .merge(textStyle),
      ),
    );
  }
}
