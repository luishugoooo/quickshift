import 'package:flutter/material.dart';
import 'package:quickshift/models/torrent/torrent_column.dart';

abstract interface class TorrentDataField<T> implements StatelessWidget {
  TorrentColumn get column;
  T? get value;
}
