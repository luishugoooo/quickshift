import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quickshift/extensions/theme.dart';
import 'package:quickshift/widgets/window/custom_window_button.dart';

class DefaultDialogFrame extends StatelessWidget {
  final String title;
  final Widget body;
  final EdgeInsets padding;
  final List<Widget> actions;
  const DefaultDialogFrame(
      {super.key,
      required this.body,
      this.title = '',
      this.padding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
      this.actions = const []});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: context.theme.colorScheme.surface,
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
        child: SizedBox(
          width: 600,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerLowest,
                ),
                height: 35,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text(
                        title,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: theme.colorScheme.secondary),
                      ),
                    ),
                    CustomWindowButton(
                      onPress: () => context.pop(),
                      icon: CloseIcon(
                        color: theme.colorScheme.secondary,
                      ),
                      mouseOverColor: Colors.red,
                    )
                  ],
                ),
              ),
              Padding(
                padding: padding,
                child: body,
              ),
              if (actions.isNotEmpty) ...[
                const Divider(
                  height: 0,
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: actions,
                  ),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
