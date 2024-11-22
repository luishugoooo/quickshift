import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_resizable_container/flutter_resizable_container.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quickshift/data/torrent/torrent_client_provider.dart';
import 'package:quickshift/extensions/theme.dart';
import 'package:quickshift/models/torrent/torrent_column.dart';
import 'package:quickshift/widgets/areas/main_area/widgets/torrent_data_fields/torrent_string_field.dart';

import '../../../../const/consts.dart';

class TorrentsPanel extends ConsumerStatefulWidget {
  const TorrentsPanel({super.key});

  @override
  ConsumerState<TorrentsPanel> createState() => _TorrentsPanelState();
}

class _TorrentsPanelState extends ConsumerState<TorrentsPanel> {
  //TODO: Use multiple listviews for individual columns
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
    final colorScheme = context.theme.colorScheme;
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  e.label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Expanded(
                    child: NotificationListener<ScrollNotification>(
                  onNotification: (notification) {
                    for (var entry in scrollControllers.entries) {
                      entry.value.jumpTo(scrollControllers[e]!.offset);
                    }
                    return true;
                  },
                  child: ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context).copyWith(
                        scrollbars: e.index + 1 < TorrentColumn.values.length
                            ? false
                            : true),
                    child: FocusTraversalGroup(
                      child: CallbackShortcuts(
                        bindings: {
                          LogicalKeySet(LogicalKeyboardKey.arrowDown): () {
                            if (selectedRow != null &&
                                selectedRow! < MOCK_TORRENTS.length - 1) {
                              setState(() {
                                selectedRow = selectedRow! + 1;
                              });
                            }
                          },
                          LogicalKeySet(LogicalKeyboardKey.arrowUp): () {
                            if (selectedRow != null && selectedRow! > 0) {
                              setState(() {
                                selectedRow = selectedRow! - 1;
                              });
                            }
                          },
                        },
                        child: Focus(
                          child: ListView.builder(
                            controller: scrollControllers[e],
                            itemExtent: 28,
                            itemCount: MOCK_TORRENTS.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () => setState(() {
                                  selectedRow = index;
                                  Focus.of(context).requestFocus();
                                }),
                                child: Container(
                                  color: selectedRow == index
                                      ? colorScheme.primary.withOpacity(0.2)
                                      : index.isEven
                                          ? colorScheme.primary.withOpacity(0.1)
                                          : colorScheme.primaryContainer
                                              .withOpacity(0.1),
                                  child: ref.watch(torrentsProvider).when(
                                        data: (torrents) {
                                          if (torrents == null) {
                                            return const Center(
                                              child: Text("No torrents"),
                                            );
                                          }
                                          final torrent = torrents[index];
                                          return Center(
                                            child: torrent.fields.firstWhere(
                                              (element) => element.column == e,
                                              orElse: () => TorrentStringField(
                                                  column: e, value: null),
                                            ),
                                          );
                                        },
                                        loading: () => const Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                        error: (error, stackTrace) =>
                                            throw error,
                                      ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ))
              ],
            ),
          );
        },
      ).toList(),
    );
  }
}
