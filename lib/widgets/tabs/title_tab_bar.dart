import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quickshift/state/tabs.dart';
import 'package:quickshift/widgets/tabs/title_tab.dart';

class TitleTabBar extends ConsumerStatefulWidget {
  const TitleTabBar({super.key});

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
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: constraints.maxHeight * 0.75,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                            icon: FontAwesomeIcons.server,
                            isSelected: currentTab.id == e.id);
                      },
                    ),
                    IconButton(
                      key: UniqueKey(),
                      onPressed: () {
                        ref
                            .read(tabsProvider.notifier)
                            .newTab(setCurrent: true);
                      },

                      //splashColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      iconSize: 16,
                      icon: const FaIcon(
                        FontAwesomeIcons.plus,
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
