import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quickshift/icons/dynamic_icons.dart';
import 'package:quickshift/state/tabs.dart';
import 'package:quickshift/widgets/tabs/title_tab.dart';
import 'package:quickshift/widgets/test_border.dart';

class TitleTabBar extends ConsumerStatefulWidget {
  const TitleTabBar({super.key});

  //FocusScopeNode focusScopeNode = FocusScopeNode();

  @override
  ConsumerState<TitleTabBar> createState() => _TitleTabBarState();
}

class _TitleTabBarState extends ConsumerState<TitleTabBar> {
  ScrollController scrollController = ScrollController();

  //TODO: rework this, tabs are just not perfect yet
  @override
  Widget build(BuildContext context) {
    final tabs = ref.watch(tabsProvider);
    final currentTab = ref.watch(currentTabProvider);
    return LayoutBuilder(builder: (context, constraints) {
      return TestBorder(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: constraints.maxHeight * 0.75,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Focus(
                  autofocus: true,
                  child: SingleChildScrollView(
                    controller: scrollController,
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ...tabs.map(
                            (e) {
                              return TitleTab(
                                  key: ValueKey(e.id),
                                  tab: e,
                                  onTap: () {
                                    ref
                                        .read(currentTabProvider.notifier)
                                        .selectTab(e);
                                  },
                                  title: e.server?.name ?? "Tab ${e.id}",
                                  icon: DynamicIcons.server.getIconData(),
                                  isSelected: currentTab.id == e.id);
                            },
                          ),
                          IconButton(
                            onPressed: () {
                              ref
                                  .read(tabsProvider.notifier)
                                  .newTab(setCurrent: true);
                            },

                            //splashColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            iconSize: 16,
                            icon: Icon(
                              DynamicIcons.add.getIconData(),
                              size: 16,
                            ),
                          )
                        ]),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
