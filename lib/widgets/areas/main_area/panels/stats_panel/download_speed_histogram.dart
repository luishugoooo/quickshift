import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quickshift/data/torrent/torrent_provider.dart';

class DownloadSpeedHistogram extends ConsumerStatefulWidget {
  const DownloadSpeedHistogram({super.key});

  @override
  ConsumerState<DownloadSpeedHistogram> createState() =>
      _DownloadSpeedHistogramState();
}

class _DownloadSpeedHistogramState
    extends ConsumerState<DownloadSpeedHistogram> {
  final List<int> history = [];
  @override
  Widget build(BuildContext context) {
    ref.listen(
      selectedTorrentProvider,
      (previous, next) {
        if (previous?.id != next?.id && next != null) {
          history.clear();
        }
        setState(() {
          history.insert(0, next?.downloadSpeed ?? 0);
        });
      },
    );
    return ListView(
      children: [
        ...history.map(
          (e) => Text(e.toString()),
        ),
        Text(ref.watch(selectedTorrentProvider).toString())
      ],
    );
  }
}
