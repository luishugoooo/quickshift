import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quickshift/const/color.dart';
import 'package:quickshift/data/torrent/torrent_client_provider.dart';
import 'package:quickshift/icons/dynamic_icons.dart';
import 'package:quickshift/state/tabs.dart';

class Toolbar extends ConsumerWidget {
  const Toolbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final colorScheme = context.theme.colorScheme;
    final currentTab = ref.watch(currentTabProvider);
    return Container(
      color: tabColorDark,
      height: 50,
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              DynamicIcons.refresh.getIconData(),
              size: 20,
            ),
            onPressed: () {
              ref.invalidate(torrentsProvider);
            },
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                DynamicIcons.close.getIconData(),
                size: 20,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                DynamicIcons.add.getIconData(),
                size: 20,
              )),
          IconButton(
              onPressed: () {
                ref.read(torrentClientProvider(currentTab).notifier).init();
              },
              icon: Icon(
                DynamicIcons.play.getIconData(),
                size: 20,
              )),
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
