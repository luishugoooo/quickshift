import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quickshift/extensions/theme.dart';
import 'package:quickshift/widgets/areas/main_area/main_area.dart';
import 'package:quickshift/widgets/toolbar/toolbar.dart';
import 'package:quickshift/widgets/window/title_bar.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = context.theme;
    return const Scaffold(
      body: Column(
        children: [TitleBar(), Toolbar(), Expanded(child: MainArea())],
      ),
    );
  }
}
