import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:quickshift/const/color.dart';
import 'package:quickshift/const/dimensions.dart';
import 'package:quickshift/widgets/tabs/title_tab_bar.dart';
import 'package:quickshift/widgets/window/window_buttons.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({super.key});

  @override
  Widget build(BuildContext context) {
    //final theme = context.theme;
    return Container(
      height: titleBarHeight,
      decoration: const BoxDecoration(color: titleBarColorDark),
      child: Row(
        children: [
          if (Platform.isMacOS)
            const SizedBox(
              width: 60,
            ),
          const Expanded(
              child: Stack(
            children: [
              MoveWindow(),
              TitleTabBar(),
            ],
          )),
          const WindowButtons(),
        ],
      ),
    );
  }
}
