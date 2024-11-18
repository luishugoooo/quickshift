import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quickshift/extensions/theme.dart';
import 'package:quickshift/models/torrent_status.dart' as tf;
import 'package:quickshift/state/tabs.dart';
import 'package:quickshift/state/torrent_status.dart';

class FilterPanel extends ConsumerWidget {
  const FilterPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //TODO: add a setting to synchronize filters across tabs
    final tab = ref.watch(currentTabProvider);
    return ListView.builder(
      itemCount: tf.TorrentStatus.values.length,
      itemBuilder: (context, index) {
        final filter = tf.TorrentStatus.values[index];
        final selected = ref.watch(torrentStatusProvider(tab)) == filter;
        return ListTile(
          splashColor: Colors.transparent,
          focusColor:
              selected ? context.theme.colorScheme.primaryContainer : null,
          onTap: () =>
              ref.read(torrentStatusProvider(tab).notifier).setFilter(filter),
          selectedTileColor: context.theme.colorScheme.primaryContainer,
          selected: ref.watch(torrentStatusProvider(tab)) == filter,
          trailing: Icon(
            filter.icon.getIconData(),
            size: 22,
          ),
          title: Text(
            filter.label,
            style: const TextStyle(fontSize: 15),
          ),
        );
      },
    );
  }
}
