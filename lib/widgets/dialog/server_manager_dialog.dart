import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quickshift/widgets/dialog/default_dialog_frame.dart';

class ServerManagerDialog extends ConsumerWidget {
  const ServerManagerDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const DefaultDialogFrame(title: "Servers", body: SizedBox());
  }
}
