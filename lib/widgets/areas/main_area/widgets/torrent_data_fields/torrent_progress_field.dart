import 'package:flutter/material.dart';
import 'package:quickshift/models/torrent/torrent_column.dart';
import 'package:quickshift/widgets/areas/main_area/widgets/torrent_data_fields/not_available_text.dart';
import 'package:quickshift/widgets/areas/main_area/widgets/torrent_data_fields/torrent_data_field.dart';

class TorrentProgressField extends StatelessWidget
    implements TorrentDataField<double> {
  @override
  final TorrentColumn column;
  @override
  final double? value;
  const TorrentProgressField(
      {super.key, required this.column, required this.value});

  @override
  Widget build(BuildContext context) {
    if (value == null) {
      return const NotAvailableText();
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: LinearProgressIndicator(
                minHeight: constraints.maxHeight / 1.5,
                borderRadius: BorderRadius.circular(2),
                value: value,
                //color: Colors.blue,
                //valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            ),
            Center(
              child: Text(
                '${(value! * 100).toStringAsFixed((value!.round() == value) ? 0 : 1)}%',
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    overflow: TextOverflow.ellipsis),
              ),
            ),
          ],
        ),
      );
    });
  }
}
