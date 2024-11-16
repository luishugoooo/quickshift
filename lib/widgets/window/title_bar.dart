import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:quickshift/const/color.dart';
import 'package:quickshift/extensions/theme.dart';
import 'package:quickshift/widgets/tabs/title_tab_bar.dart';
import 'package:quickshift/widgets/window/window_buttons.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Container(
      height: 50,
      decoration: const BoxDecoration(color: titleBarColorDark),
      child: Row(
        children: [
          Expanded(
            child: MoveWindow(
              child: const TitleTabBar(),
            ),
          ),
          const WindowButtons(),
        ],
      ),
    );
  }
}
