import 'package:flutter/material.dart';

class DefaultElevatedButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final TextStyle? textStyle;
  const DefaultElevatedButton(
      {super.key, required this.onPressed, required this.text, this.textStyle});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          overlayColor: colorScheme.surface,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
      child: Text(
        text,
        style:
            TextStyle(color: colorScheme.onPrimary, fontWeight: FontWeight.w500)
                .merge(textStyle),
      ),
    );
  }
}
