import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quickshift/data/torrent/torrent_provider.dart';
import 'package:quickshift/widgets/util/iterable.dart';

class DownloadSpeedHistogram extends ConsumerStatefulWidget {
  const DownloadSpeedHistogram({super.key});

  @override
  ConsumerState<DownloadSpeedHistogram> createState() =>
      _DownloadSpeedHistogramState();
}

class _DownloadSpeedHistogramState
    extends ConsumerState<DownloadSpeedHistogram> {
  final List<int> history = [];
  final Map<int, List<int>> cachedHistories = {};

  void addSpeed(int torrentId, int value) {
    history.add(value);
    if (cachedHistories.containsKey(torrentId)) {
      cachedHistories[torrentId]!.add(value);
    } else {
      cachedHistories[torrentId] = [value];
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      selectedTorrentProvider,
      (previous, next) {
        if (next?.id != previous?.id) {
          if (next == null) return;

          setState(() {
            history.clear();
            if (cachedHistories.containsKey(next.id)) {
              history.addAll(cachedHistories[next.id]!);
            }
          });
        }
        setState(() {
          addSpeed(next!.id, next.downloadSpeed!);
        });
      },
    );

    return LineChart(
      history.isNotEmpty
          ? LineChartData(
              minX: (max(history.length - 100, 0)),
              maxX: history.length.toDouble() - 1,
              minY: history
                      .reduce(
                        (p, n) => min(p, n),
                      )
                      .toDouble() /
                  10,
              maxY: history
                      .reduce(
                        (p, n) => max(p, n),
                      )
                      .toDouble() *
                  1.5,
              clipData: const FlClipData.horizontal(),
              lineBarsData: [
                  LineChartBarData(
                      spots: history
                          .mapWithIndex<int, FlSpot>(
                            (e, index) => FlSpot(
                              index.toDouble(),
                              e.toDouble(),
                            ),
                          )
                          .toList(),
                      dotData: FlDotData(
                        getDotPainter: (p0, p1, p2, p3) =>
                            FlDotCirclePainter(radius: 0),
                      ))
                ])
          : LineChartData(),
/*       duration: history.isUnfilled
          ? const Duration(milliseconds: 150)
          : Duration.zero, */
    );
  }
}
