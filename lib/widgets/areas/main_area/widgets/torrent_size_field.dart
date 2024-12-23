import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quickshift/models/torrent/torrent_column.dart';
import 'package:quickshift/widgets/areas/main_area/widgets/torrent_data_fields/not_available_text.dart';
import 'package:quickshift/widgets/areas/main_area/widgets/torrent_data_fields/torrent_data_field.dart';

class TorrentSizeField extends StatelessWidget
    implements TorrentDataField<int> {
  @override
  final TorrentColumn column;
  @override
  final int? value;
  const TorrentSizeField(
      {super.key, required this.column, required this.value});

  String buildString() {
    if (value! < 1024) {
      return '$value B';
    } else if (value! < pow(1024, 2)) {
      return '${(value! / 1024).toStringAsFixed(2)} KB';
    } else if (value! < pow(1024, 3)) {
      return '${(value! / 1024 / 1024).toStringAsFixed(2)} MB';
    } else {
      return '${(value! / 1024 / 1024 / 1024).toStringAsFixed(2)} GB';
    }
  }

  @override
  Widget build(BuildContext context) {
    if (value == null) {
      return const NotAvailableText();
    }
    return Center(
        child: Text(
      buildString(),
      overflow: TextOverflow.ellipsis,
    ));
  }
}
