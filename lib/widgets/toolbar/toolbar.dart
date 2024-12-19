import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:quickshift/const/color.dart';
import 'package:quickshift/const/consts.dart';
import 'package:quickshift/data/drift/settings_notifier.dart';
import 'package:quickshift/data/torrent/torrent_client_provider.dart';
import 'package:quickshift/data/torrent/torrent_provider.dart';
import 'package:quickshift/models/backends/torrent_client_interface.dart';
import 'package:quickshift/models/backends/transmission/transmission_client.dart';
import 'package:quickshift/state/tabs.dart';
import 'package:quickshift/widgets/areas/settings/settings_dialog.dart';
import 'package:quickshift/widgets/dialog/default_dialog_frame.dart';
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
    final currentClient = ref.watch(currentClientProvider);

    final globalSettings = ref.watch(settingsProvider);

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
                ref.read(tabsProvider.notifier).setConfig(currentTab, server);
                ref.read(currentClientProvider.notifier).init();
              },
              currentTab: currentTab,
              icon: FontAwesomeIcons.plug,
              tooltip: "Quick connect",
              selectedConfig: currentTab.config,
              servers: MOCK_SERVERS),
          ToolbarIconButton(
              icon: FontAwesomeIcons.plugCircleMinus,
              onPressed:
                  (currentClient.clientStatus is TorrentClientStatusInitialized)
                      ? () {
                          ref.read(currentClientProvider.notifier).disconnect();
                        }
                      : null),
          ToolbarIconButton(
              icon: FontAwesomeIcons.plus,
              onPressed: currentClient.clientStatus
                      is! TorrentClientStatusInitialized
                  ? null
                  : () => ref.read(torrentsProvider.notifier).addTorrentFromMagnet(
                      "magnet:?xt=urn:btih:265863cbbb5ed9ef39e7c891ebebdf1623b09d5e&dn=archlinux-2024.12.01-x86_64.iso ")),
          ToolbarIconButton(
            icon: FontAwesomeIcons.gear,
            onPressed: () => showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => SettingsDialog(
                settings: globalSettings,
              ),
            ),
          ),
          ToolbarIconButton(
            icon: FontAwesomeIcons.accusoft,
            onPressed: () => showDialog(
              context: context,
              builder: (context) => const DefaultDialogFrame(body: SizedBox()),
            ),
          ),

          const Spacer(),
          Text(currentClient.clientStatus.toString()),
          ToolbarIconButton(
            icon: FontAwesomeIcons.arrowsRotate,
            onPressed: () {},
          ),
          const Gap(5),
          //Text((currentTab.client?.isInit.toString()) ?? "Null"),
          Text((currentClient is TransmissionClient)
              ? currentClient.sessionId ?? "No session"
              : "lol"),
          const Gap(5),
        ],
      ),
    );
  }
}
