import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quickshift/const/color.dart';
import 'package:quickshift/const/consts.dart';
import 'package:quickshift/data/torrent/torrent_client_provider.dart';
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
                ref.read(tabsProvider.notifier).setServer(currentTab, server);
              },
              icon: FontAwesomeIcons.plug,
              tooltip: "Quick connect",
              servers: MOCK_SERVERS),
          ToolbarIconButton(
            onPressed: !(ref
                        .watch(torrentClientProvider(currentTab))
                        ?.isInitialized ??
                    false)
                ? () {
                    ref.read(torrentClientProvider(currentTab).notifier).init();
                  }
                : null,
            icon: FontAwesomeIcons.play,
          ),
          Text(ref
                  .watch(torrentClientProvider(currentTab))
                  ?.isInitialized
                  .toString() ??
              "null"),
        ],
      ),
    );
  }
}
