import 'package:flutter/material.dart';
import 'package:flutter_context_menu/flutter_context_menu.dart';
import 'package:quickshift/extensions/theme.dart';
import 'package:quickshift/models/torrent/torrent_column.dart';
import 'package:quickshift/models/torrent/torrent_data.dart';
import 'package:quickshift/widgets/areas/main_area/panels/torrents_panel/torrent_context_menu.dart';
import 'package:quickshift/widgets/areas/main_area/widgets/torrent_data_fields/torrent_string_field.dart';

class TorrentColumnWidget extends StatelessWidget {
  final TorrentColumn e;
  final ScrollController scrollController;
  final List<TorrentData> torrents;
  final int? selectedRow;
  final Function(int torrentIndex) onSelected;
  final Function(TorrentColumn torrentColumn, ScrollController controller)
      onScrollEvent;
  const TorrentColumnWidget(
      {super.key,
      required this.e,
      required this.scrollController,
      required this.torrents,
      required this.selectedRow,
      required this.onSelected,
      required this.onScrollEvent});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;
    return Column(
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
            //scrollController.jumpTo(scrollControllers[e]!.offset);
            onScrollEvent(e, scrollController);
            return true;
          },
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(
                scrollbars:
                    e.index + 1 < TorrentColumn.values.length ? false : true),
            child: ListView.builder(
              controller: scrollController,
              itemExtent: 28,
              itemCount: torrents.length,
              itemBuilder: (context, index) {
                final torrent = torrents[index];
                final isSelected = selectedRow == index;
                Offset mousePosition = Offset.zero;
                return Listener(
                  onPointerDown: (event) {
                    mousePosition = event.position;
                  },
                  child: GestureDetector(
                    onTap: () => onSelected(index),
                    onSecondaryTap: () {
                      onSelected(index);
                      showContextMenu(
                        opaque: false,
                        context,
                        contextMenu: buildTorrentContextMenu(torrent,
                            onStop: () {},
                            positon: mousePosition,
                            colorScheme: colorScheme),
                      );
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          color: isSelected
                              ? colorScheme.primary.withOpacity(0.2)
                              : index.isEven
                                  ? colorScheme.primary.withOpacity(0.1)
                                  : colorScheme.primaryContainer
                                      .withOpacity(0.1),
                        ),
                        child: torrent.fields.firstWhere(
                          (element) => element.column == e,
                          orElse: () =>
                              TorrentStringField(column: e, value: null),
                        )),
                  ),
                );
              },
            ),
          ),
        ))
      ],
    );
  }
}
