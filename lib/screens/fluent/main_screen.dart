import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quickshift/state/tabs.dart';
import 'package:quickshift/widgets/areas/main_area/main_area.dart';
import 'package:quickshift/widgets/toolbar/toolbar.dart';
import 'package:quickshift/widgets/window/title_bar.dart';

import '../../const/bindings/global_tab_shortcut_bindings.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabs = ref.watch(tabsProvider);
    return Scaffold(
      body: CallbackShortcuts(
        bindings: {
          const SingleActivator(LogicalKeyboardKey.keyW, control: true): () {
            ref
                .read(tabsProvider.notifier)
                .closeTab(ref.read(currentTabProvider));
          },
          const SingleActivator(LogicalKeyboardKey.keyT, control: true): () {
            ref.read(tabsProvider.notifier).newTab(setCurrent: true);
          },
          ...Map.fromEntries(keys1To9
              .map((e) => MapEntry(SingleActivator(e, control: true), () {
                    final index = keys1To9.indexOf(e);
                    if (index < tabs.length) {
                      ref
                          .read(currentTabProvider.notifier)
                          .selectTab(tabs[index]);
                    }
                  })))
        },
        child: const Column(
          children: [TitleBar(), Toolbar(), Expanded(child: MainArea())],
        ),
      ),
    );
  }
}
