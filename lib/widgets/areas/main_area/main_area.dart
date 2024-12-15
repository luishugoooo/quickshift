import 'package:flutter/material.dart';
import 'package:flutter_resizable_container/flutter_resizable_container.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quickshift/widgets/areas/main_area/panels/filter_panel.dart';
import 'package:quickshift/widgets/areas/main_area/panels/torrents_panel/torrents_panel.dart';
import 'package:quickshift/widgets/util/logging.dart';

class MainArea extends ConsumerWidget {
  const MainArea({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ResizableContainer(direction: Axis.vertical, children: [
      const ResizableChild(
        child: ResizableContainer(
            divider:
                ResizableDivider(thickness: 2, length: ResizableSize.expand()),
            children: [
              ResizableChild(
                  child: FilterPanel(), size: ResizableSize.ratio(0.22)),
              ResizableChild(
                  child: TorrentsPanel(), size: ResizableSize.expand())
            ],
            direction: Axis.horizontal),
      ),
      ResizableChild(
          size: const ResizableSize.ratio(0.3),
          child: Builder(builder: (context) {
            final logs = ref.watch(loggingProvider);

            return ListView.builder(
              itemCount: logs.length,
              itemBuilder: (context, index) {
                return Text(logs[index]);
              },
            );
          }))
    ]);
  }
}
