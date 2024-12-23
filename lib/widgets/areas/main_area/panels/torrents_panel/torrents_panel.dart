import 'package:flutter/material.dart';
import 'package:flutter_resizable_container/flutter_resizable_container.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quickshift/data/torrent/torrent_client_provider.dart';
import 'package:quickshift/data/torrent/torrents_provider.dart';
import 'package:quickshift/models/backends/torrent_client_interface.dart';
import 'package:quickshift/models/torrent/torrent_column.dart';
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

  bool isScrolling = false;

  @override
  Widget build(BuildContext context) {
    final client = ref.watch(currentClientProvider);
    final torrents = ref.watch(filteredTorrentsProvider);
    return Center(
        child: switch (client.clientStatus) {
      TorrentClientStatusUnconfigured() => const Text("Select a server"),
      TorrentClientStatusConfigured() => Column(
          spacing: 5,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                "Selected server: ${client.config.name} (${client.config.host})"),
            TextButton(
                onPressed: () {
                  ref.read(currentClientProvider.notifier).init();
                },
                child: const Text("Connect"))
          ],
        ),
      TorrentClientStatusError() => Text(client.clientStatus.toString()),
      TorrentClientStatusLoading() ||
      TorrentClientStatusInitialized() =>
        torrents.when(
            skipLoadingOnReload: true,
            data: (data) {
              return ResizableContainer(
                divider: ResizableDivider(color: Colors.grey[900]),
                direction: Axis.horizontal,
                children: TorrentColumn.values.map(
                  (e) {
                    return ResizableChild(
                        minSize: 5,
                        size: switch (e) {
                          TorrentColumn.name =>
                            const ResizableSize.expand(flex: 3),
                          TorrentColumn.id => const ResizableSize.pixels(50),
                          _ => const ResizableSize.expand()
                        },
                        child: TorrentColumnWidget(
                          e: e,
                          scrollController: scrollControllers[e]!,
                          torrents: data,
                          selectedTorrentId:
                              ref.watch(selectedTorrentIdProvider) ?? -1,
                          onSelected: (torrentIndex) {
                            setState(() => ref
                                .read(selectedTorrentIdProvider.notifier)
                                .select(torrentIndex));
                          },
                          onScrollEvent: (torrentColumn, controller) {
                            for (final key in scrollControllers.keys) {
                              if (key != torrentColumn && !isScrolling) {
                                isScrolling = true;
                                scrollControllers[key]!
                                    .jumpTo(controller.offset);
                                isScrolling = false;
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
            loading: () {
              return const CircularProgressIndicator();
            }),
    });
  }
}
