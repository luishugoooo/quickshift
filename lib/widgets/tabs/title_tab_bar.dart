import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quickshift/icons/dynamic_icons.dart';
import 'package:quickshift/state/tabs.dart';
import 'package:quickshift/widgets/tabs/title_tab.dart';

class TitleTabBar extends ConsumerWidget {
  const TitleTabBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabs = ref.watch(tabsProvider);
    final currentTab = ref.watch(currentTabProvider);
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: constraints.maxHeight * 0.75,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                ...tabs.map(
                  (e) {
                    return TitleTab(
                        onTap: () => ref
                            .read(currentTabProvider.notifier)
                            .selectTab(e.id),
                        title: e.server?.name ?? "Tab ${e.id}",
                        icon: DynamicIcons.server,
                        isSelected: currentTab.id == e.id);
                  },
                ),
                IconButton(
                  onPressed: () =>
                      ref.read(tabsProvider.notifier).newTab(setCurrent: true),
                  //splashColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  iconSize: 16,
                  icon: Icon(
                    DynamicIcons.add,
                    size: 16,
                  ),
                )
              ]),
            ),
          ),
        ],
      );
    });
  }
}
