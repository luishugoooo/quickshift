import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:quickshift/const/color.dart';
import 'package:quickshift/const/consts.dart';
import 'package:quickshift/data/torrent/torrent_client_provider.dart';
import 'package:quickshift/models/backends/transmission/transmission_client.dart';
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
                final tab = ref
                    .read(tabsProvider.notifier)
                    .setConfig(currentTab, server);
                ref.read(torrentClientProvider(tab.config!).notifier).init();
              },
              currentTab: currentTab,
              icon: FontAwesomeIcons.plug,
              tooltip: "Quick connect",
              selectedConfig: currentTab.config,
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
          //Text((currentTab.client?.isInit.toString()) ?? "Null"),

          Text(currentTab.config == null
              ? "No config"
              : (ref.watch(torrentClientProvider(currentTab.config!))
                          as TransmissionClient?)
                      ?.sessionId ??
                  "No session id")
        ],
      ),
    );
  }
}
