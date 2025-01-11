import 'package:flutter/widgets.dart';
import 'package:quickshift/extensions/theme.dart';

class SettingRow extends StatelessWidget {
  const SettingRow(
      {super.key,
      required this.title,
      required this.action,
      this.textStyle,
      this.fitted = true});

  final String title;
  final Widget action;
  final bool fitted;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      color: context.theme.colorScheme.onSurfaceVariant,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: SizedBox(
        height: 30,
        child: Row(
          children: [
            Expanded(
              child: Text(title, style: textStyle?.merge(style) ?? style),
            ),
            if (!fitted) action else FittedBox(child: action),
          ],
        ),
      ),
    );
  }
}
