import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quickshift/data/torrent/torrents_provider.dart';
import 'package:quickshift/extensions/theme.dart';
import 'package:quickshift/models/backends/options/add_torrent_options.dart';
import 'package:quickshift/widgets/buttons/default_elevated_button.dart';
import 'package:quickshift/widgets/dialog/default_dialog_frame.dart';
import 'package:quickshift/widgets/dialog/setting_row.dart';

class AddTransmissionTorrentDialog extends ConsumerStatefulWidget {
  const AddTransmissionTorrentDialog({super.key});

  @override
  ConsumerState<AddTransmissionTorrentDialog> createState() =>
      _AddTransmissionTorrentDialogState();
}

class _AddTransmissionTorrentDialogState
    extends ConsumerState<AddTransmissionTorrentDialog> {
  final TextEditingController _urlController = TextEditingController();
  final TextEditingController _downloadDirController = TextEditingController();
  bool _startImmediately = true;
  String? _metainfo;
  bool _isFilePicked = false;
  String? _fileName;

  Future<void> _pickTorrentFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['torrent'],
    );

    if (result != null) {
      File file = File(result.files.single.path!);
      _metainfo = base64Encode(await file.readAsBytes());
      setState(() {
        _isFilePicked = true;
        _fileName = result.files.single.name;
      });
    }
  }

  @override
  void initState() {
    _urlController.addListener(
      () => setState(() {}),
    );
    super.initState();
  }

  @override
  void dispose() {
    _urlController.dispose();
    _downloadDirController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultDialogFrame(
      title: 'Add Torrent',
      body: Column(
        spacing: 8,
        children: [
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: _isFilePicked
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                _fileName ?? '',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                            IconButton(
                              icon: FaIcon(
                                FontAwesomeIcons.trash,
                                size: 16,
                                color: context.theme.colorScheme.error,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isFilePicked = false;
                                  _fileName = null;
                                });
                              },
                            ),
                          ],
                        )
                      : TextField(
                          autofocus: true,
                          controller: _urlController,
                          decoration: const InputDecoration(
                            hintText: 'Enter torrent URL',
                          ),
                        ),
                ),
                const VerticalDivider(
                  thickness: 2,
                  width: 30,
                ),
                DefaultElevatedButton(
                  style: ElevatedButton.styleFrom(
                      //TODO: For some reason the animation of my custom eleveated button doesnt play, disabling it for now
                      //Oh lol it does but the fade is invisible wont fix for now
                      animationDuration: Duration.zero),
                  onPressed:
                      _urlController.text.isEmpty ? _pickTorrentFile : null,
                  text: 'Pick .torrent file',
                ),
              ],
            ),
          ),
          TextField(
            controller: _downloadDirController,
            decoration: const InputDecoration(
              hintText: 'Enter download directory',
            ),
          ),
          SettingRow(
              textStyle: context.theme.textTheme.bodyLarge,
              title: "Start immediately",
              action: Switch.adaptive(
                value: _startImmediately,
                onChanged: (value) {
                  setState(() {
                    _startImmediately = value;
                  });
                },
              ))
        ],
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
            ref
                .read(torrentsProvider.notifier)
                .addTorrent(AddTransmissionTorrentOptions(
                  magnetLink: _isFilePicked ? null : _urlController.text,
                  metainfo: _isFilePicked ? _metainfo : null,
                  downloadDir: _downloadDirController.text.isNotEmpty
                      ? _downloadDirController.text
                      : null,
                  paused: !_startImmediately,
                ));
            Navigator.of(context).pop(_urlController.text);
          },
          text: 'Add',
        ),
      ],
    );
  }
}
