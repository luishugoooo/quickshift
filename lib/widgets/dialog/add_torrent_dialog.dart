import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quickshift/data/torrent/torrents_provider.dart';
import 'package:quickshift/widgets/buttons/default_elevated_button.dart';

import 'default_dialog_frame.dart';

class AddTorrentDialog extends ConsumerStatefulWidget {
  const AddTorrentDialog({super.key});

  @override
  ConsumerState<AddTorrentDialog> createState() => _AddTorrentDialogState();
}

class _AddTorrentDialogState extends ConsumerState<AddTorrentDialog> {
  final TextEditingController _urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultDialogFrame(
      title: 'Add Torrent',
      body: TextField(
        autofocus: true,
        controller: _urlController,
        decoration: const InputDecoration(
          hintText: 'Enter torrent URL',
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        DefaultElevatedButton(
          onPressed: () {
            ref.read(torrentsProvider.notifier).addTorrentFromMagnet(
                "magnet:?xt=urn:btih:265863cbbb5ed9ef39e7c891ebebdf1623b09d5e&dn=archlinux-2024.12.01-x86_64.iso");
            Navigator.of(context).pop(_urlController.text);
          },
          text: 'Add',
        ),
      ],
    );
  }

  @override
  void dispose() {
    _urlController.dispose();
    super.dispose();
  }
}
