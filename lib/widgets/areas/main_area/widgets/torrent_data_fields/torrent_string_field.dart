import 'package:flutter/material.dart';
import 'package:quickshift/models/torrent/torrent_column.dart';
import 'package:quickshift/widgets/areas/main_area/widgets/torrent_data_fields/not_available_text.dart';
import 'package:quickshift/widgets/areas/main_area/widgets/torrent_data_fields/torrent_data_field.dart';

class TorrentStringField extends StatelessWidget
    implements TorrentDataField<String> {
  @override
  final TorrentColumn column;
  @override
  final String? value;
  final CrossAxisAlignment horizontalAlignment;

  const TorrentStringField(
      {super.key,
      required this.column,
      required this.value,
      this.horizontalAlignment = CrossAxisAlignment.start});

  @override
  Widget build(BuildContext context) {
    if (value == null) {
      return const NotAvailableText();
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: horizontalAlignment,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value!,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
