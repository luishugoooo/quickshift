import 'package:flutter/material.dart';
import 'package:flutter_resizable_container/flutter_resizable_container.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quickshift/data/torrent/torrent_client_provider.dart';
import 'package:quickshift/models/torrent/torrent_column.dart';
import 'package:quickshift/state/tabs.dart';
import 'package:quickshift/widgets/areas/main_area/panels/torrents_panel/torrent_column.dart';

class TorrentsPanel extends ConsumerStatefulWidget {
  const TorrentsPanel({super.key});

  @override
  ConsumerState<TorrentsPanel> createState() => _TorrentsPanelState();
}

class _TorrentsPanelState extends ConsumerState<TorrentsPanel> {
  late Map<TorrentColumn, ScrollController> scrollControllers = {};

  @override
  void initState() {
    scrollControllers = TorrentColumn.values
        .asMap()
        .map((key, value) => MapEntry(value, ScrollController()));
    super.initState();
  }

  int? selectedRow;

  @override
  Widget build(BuildContext context) {
    final currentTabId = ref.watch(currentTabIdProvider);
    final currentTab = ref.watch(currentTabProvider);
    //ref.watch(tabsProvider);
    final torrentClient = currentTab.client;
    print("CLIENT INIT: ${torrentClient?.isInitialized}");

    print("REBUILDING TOR");
    return Center(
        child: torrentClient == null
            ? const Text("No server selected")
            : !torrentClient.isInitialized
                ? const CircularProgressIndicator()
                : ref.watch(torrentsProvider(currentTabId)).when(
                    data: (data) {
                      return ResizableContainer(
                        divider: ResizableDivider(color: Colors.grey[900]),
                        direction: Axis.horizontal,
                        children: TorrentColumn.values.map(
                          (e) {
                            return ResizableChild(
                                minSize: 60,
                                size: e == TorrentColumn.name
                                    ? const ResizableSize.ratio(0.3)
                                    : const ResizableSize.expand(),
                                child: TorrentColumnWidget(
                                  e: e,
                                  scrollController: scrollControllers[e]!,
                                  torrents: data,
                                  selectedRow: selectedRow,
                                  onSelected: (torrentIndex) {
                                    setState(() => selectedRow = torrentIndex);
                                    print("Selected row: $selectedRow");
                                  },
                                  onScrollEvent: (torrentColumn, controller) {
                                    for (final key in scrollControllers.keys) {
                                      if (key != torrentColumn) {
                                        scrollControllers[key]!
                                            .jumpTo(controller.offset);
                                      }
                                    }
                                  },
                                ));
                          },
                        ).toList(),
                      );
                    },
                    error: (error, stackTrace) {
                      return Text("Error: $error");
                    },
                    loading: () => const CircularProgressIndicator()));
  }
}
