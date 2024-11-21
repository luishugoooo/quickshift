import 'package:flutter/material.dart';
import 'package:quickshift/models/torrent/torrent_column.dart';
import 'package:quickshift/widgets/areas/main_area/widgets/torrent_data_fields/not_available_text.dart';
import 'package:quickshift/widgets/areas/main_area/widgets/torrent_data_fields/torrent_data_field.dart';

class TorrentSpeedField extends StatelessWidget
    implements TorrentDataField<int> {
  @override
  final TorrentColumn column;
  @override
  final int? value;
  const TorrentSpeedField(
      {super.key, required this.column, required this.value});

  String buildString() {
    if (value! < 1024) {
      return '$value B/s';
    } else if (value! < 1024 * 1024) {
      return '${(value! / 1024).toStringAsFixed(2)} KB/s';
    } else {
      return '${(value! / 1024 / 1024).toStringAsFixed(2)} MB/s';
    }
  }

  @override
  Widget build(BuildContext context) {
    if (value == null) {
      return const NotAvailableText();
    }
    return Text(buildString());
  }
}
