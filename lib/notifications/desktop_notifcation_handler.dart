import 'package:flutter/material.dart';
import "package:flutter_local_notifications/flutter_local_notifications.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quickshift/data/torrent/torrents_provider.dart';

class DesktopNotifcationHandler extends ConsumerWidget {
  final Widget child;
  const DesktopNotifcationHandler({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      torrentsProvider,
      (previous, next) {
        final prev = previous?.value;
        final current = next.value;
        if (prev == null || current == null) return;
        for (var pT in prev) {
          final cT = current.where((t) => t.id == pT.id).firstOrNull;
          if (cT == null) continue;
          print(
              "Checking ${cT.name}, previous: ${pT.progress}, current: ${cT.progress}");
          if (pT.progress != 1 && cT.progress == 1) {
            print("Download finished");

            FlutterLocalNotificationsPlugin().show(
                cT.id,
                "Download finished",
                "${cT.name} has finished downloading",
                const NotificationDetails());
          }
        }
      },
    );
    return child;
  }
}
