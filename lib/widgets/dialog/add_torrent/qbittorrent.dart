import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quickshift/data/torrent/torrents_provider.dart';
import 'package:quickshift/widgets/buttons/default_elevated_button.dart';
import 'package:quickshift/widgets/dialog/default_dialog_frame.dart';

class AddQbittorrentTorrentDialog extends ConsumerStatefulWidget {
  const AddQbittorrentTorrentDialog({super.key});

  @override
  ConsumerState<AddQbittorrentTorrentDialog> createState() =>
      _AddQbittorrentTorrentDialogState();
}

class _AddQbittorrentTorrentDialogState
    extends ConsumerState<AddQbittorrentTorrentDialog> {
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
            throw UnimplementedError();
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
