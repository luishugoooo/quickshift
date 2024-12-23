import 'package:auto_scroll/auto_scroll.dart';
import 'package:flutter/material.dart';
import 'package:flutter_resizable_container/flutter_resizable_container.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:quickshift/widgets/areas/main_area/panels/filter_panel.dart';
import 'package:quickshift/widgets/areas/main_area/panels/stats_panel/download_speed_histogram.dart';
import 'package:quickshift/widgets/areas/main_area/panels/torrents_panel/torrents_panel.dart';
import 'package:quickshift/widgets/util/logging.dart';

class MainArea extends ConsumerWidget {
  const MainArea({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    return ResizableContainer(
        direction: Axis.vertical,
        divider: ResizableDivider(
            thickness: 2,
            length: const ResizableSize.expand(),
            color: colorScheme.surfaceBright),
        children: [
          ResizableChild(
            child: ResizableContainer(
                divider: ResizableDivider(
                    thickness: 2,
                    length: const ResizableSize.expand(),
                    color: colorScheme.surfaceBright),
                children: const [
                  ResizableChild(
                      child: FilterPanel(), size: ResizableSize.ratio(0.22)),
                  ResizableChild(
                      child: TorrentsPanel(), size: ResizableSize.expand())
                ],
                direction: Axis.horizontal),
          ),
          ResizableChild(
              size: const ResizableSize.ratio(0.3),
              child: Row(
                children: [
                  Expanded(
                    child: Builder(builder: (context) {
                      final logs = ref.watch(loggingProvider);
                      return AutoScroller(
                        lengthIdentifier: logs.length,
                        builder: (context, controller) => ListView.builder(
                          itemCount: logs.length,
                          controller: controller,
                          itemBuilder: (context, index) {
                            return Text(
                                "${DateFormat("hh:mm:ss").format(logs[index].time)}: ${logs[index].log}");
                          },
                        ),
                      );
                    }),
                  ),
                  const Expanded(child: DownloadSpeedHistogram())
                ],
              ))
        ]);
  }
}
