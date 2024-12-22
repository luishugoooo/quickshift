import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quickshift/data/drift/settings/settings_notifier.dart';
import 'package:quickshift/extensions/theme.dart';
import 'package:quickshift/models/torrent_status.dart' as tf;
import 'package:quickshift/state/tabs.dart';
import 'package:quickshift/state/torrent_status.dart';

class FilterPanel extends ConsumerWidget {
  const FilterPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTab = ref.watch(currentTabProvider);
    //This is safe because the value is always set
    final syncFiltersAcrossTabs =
        ref.watch(settingsProvider).synchronizeFiltersAcrossTabs;

    final filterProvider =
        torrentStatusFilterProvider(syncFiltersAcrossTabs ? null : currentTab);

    final selectedFilter = ref.watch(filterProvider);
    final filterNotifier = ref.watch(filterProvider.notifier);
    return ListView.builder(
      itemCount: tf.TorrentStatus.values.length,
      itemBuilder: (context, index) {
        final filter = tf.TorrentStatus.values[index];
        final selected = selectedFilter == filter;
        return ListTile(
          splashColor: Colors.transparent,
          focusColor:
              selected ? context.theme.colorScheme.primaryContainer : null,
          onTap: () => filterNotifier.setFilter(filter),
          selectedTileColor: context.theme.colorScheme.primaryContainer,
          selected: selected,
          dense: true,
          trailing: FaIcon(
            filter.icon,
            size: 20,
          ),
          title: Text(
            filter.label,
            style: const TextStyle(fontSize: 14),
          ),
        );
      },
    );
  }
}
