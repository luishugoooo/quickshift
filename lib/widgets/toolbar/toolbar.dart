import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:quickshift/const/color.dart';
import 'package:quickshift/const/consts.dart';
import 'package:quickshift/state/tabs.dart';
import 'package:quickshift/widgets/toolbar/toolbar_icon_button.dart';
import 'package:quickshift/widgets/toolbar/toolbar_quick_connect_dropdown_icon_button.dart';

class Toolbar extends ConsumerStatefulWidget {
  const Toolbar({super.key});

  @override
  ConsumerState<Toolbar> createState() => _ToolbarState();
}

class _ToolbarState extends ConsumerState<Toolbar> {
  Offset mousePosition = const Offset(0, 0);

  @override
  Widget build(BuildContext context) {
    //final colorScheme = context.theme.colorScheme;
    final currentTabId = ref.watch(currentTabIdProvider);

    final currentTab = ref.watch(currentTabProvider);
    return Container(
      color: tabColorDark,
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          ToolbarIconButton(
            icon: FontAwesomeIcons.server,
            tooltip: "Server Manager",
            onPressed: () {},
          ),
          ToolbarQuickConnectDropdownIconButton(
              onServerSelected: (server) async {
                ref.read(tabsProvider.notifier).setServer(currentTab, server);
                ref.read(tabsProvider.notifier).initClient(currentTabId);
              },
              icon: FontAwesomeIcons.plug,
              tooltip: "Quick connect",
              servers: MOCK_SERVERS),
          const ToolbarIconButton(
            onPressed: null,
            icon: FontAwesomeIcons.play,
          ),
          const Spacer(),
          ToolbarIconButton(
            icon: FontAwesomeIcons.arrowsRotate,
            onPressed: () {},
          ),
          const Gap(5),
          Text(currentTab.server?.name ?? "null"),
          const Gap(5),
          //Text(ref.watch(torrentClientProvider(currentTab)).toString())
        ],
      ),
    );
  }
}
