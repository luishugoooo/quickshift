import 'package:flutter/material.dart';
import 'package:quickshift/const/color.dart';
import 'package:quickshift/extensions/theme.dart';

class Toolbar extends StatelessWidget {
  const Toolbar({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;
    return Container(
      color: tabColorDark,
      height: 50,
    );
  }
}
