import 'package:flutter/material.dart';
import 'package:quickshift/const/consts.dart';
import 'package:quickshift/widgets/areas/main_area/widgets/torrent_row.dart';

class MainPanel extends StatelessWidget {
  const MainPanel({super.key});

  //TODO: Use multiple listviews for individual columns. maybe set tab to null for this
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemExtent: 28,
      itemCount: MOCK_TORRENTS.length,
      itemBuilder: (context, index) {
        final torrent = MOCK_TORRENTS[index];
        return TorrentRow(torrent: torrent, alternateColor: index.isOdd);
      },
    );
  }
}
