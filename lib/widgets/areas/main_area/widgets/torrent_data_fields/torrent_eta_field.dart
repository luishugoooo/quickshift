import 'package:flutter/material.dart';
import 'package:quickshift/models/torrent/torrent_column.dart';
import 'package:quickshift/widgets/areas/main_area/widgets/torrent_data_fields/not_available_text.dart';
import 'package:quickshift/widgets/areas/main_area/widgets/torrent_data_fields/torrent_data_field.dart';
import 'package:quickshift/widgets/util/duration.dart';

class TorrentEtaField extends StatelessWidget
    implements TorrentDataField<DateTime> {
  @override
  final TorrentColumn column;

  @override
  final DateTime? value;

  @override
  const TorrentEtaField({super.key, required this.column, this.value});

  @override
  Widget build(BuildContext context) {
    if (value == null) {
      return const NotAvailableText();
    }
    final diff = value!.difference(DateTime.now()).isNegative
        ? Duration.zero
        : value!.difference(DateTime.now());

    return Center(child: Text(formatDuration(diff)));
  }
}
