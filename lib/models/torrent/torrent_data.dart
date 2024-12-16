import 'dart:convert';

import 'package:quickshift/models/backends/transmission/raw_transmission_torrent_data.dart';
import 'package:quickshift/models/torrent/torrent_column.dart';
import 'package:quickshift/models/torrent_status.dart';
import 'package:quickshift/widgets/areas/main_area/widgets/torrent_data_fields/torrent_data_field.dart';
import 'package:quickshift/widgets/areas/main_area/widgets/torrent_data_fields/torrent_eta_field.dart';
import 'package:quickshift/widgets/areas/main_area/widgets/torrent_data_fields/torrent_speed_field.dart';

import '../../widgets/areas/main_area/widgets/torrent_data_fields/torrent_progress_field.dart';
import '../../widgets/areas/main_area/widgets/torrent_data_fields/torrent_string_field.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class TorrentData {
  final int id;
  final String? name;
  final int size;
  final TorrentStatus status;

  final DateTime? eta;
  final double progress;
  const TorrentData({
    required this.id,
    required this.name,
    required this.size,
    required this.status,
    required this.eta,
    required this.progress,
  });

  int get downloadSpeed {
    return (size * progress).toInt();
  }

  int get uploadSpeed {
    return (size * progress).toInt();
  }

  ///How to add a new field:
  ///1. Create a new field widget class in widgets/areas/main_area/widgets/torrent_data_fields or use an existing one
  ///2. Add the data property to the TorrentData [this] class
  ///3. Add a corresponding Column to the TorrentColumn enum
  ///4. Add the field to the fields getter
  List<TorrentDataField> get fields => [
        TorrentStringField(column: TorrentColumn.id, value: id.toString()),
        TorrentStringField(column: TorrentColumn.name, value: name),
        TorrentStringField(column: TorrentColumn.size, value: size.toString()),
        TorrentProgressField(column: TorrentColumn.progress, value: progress),
        TorrentStringField(column: TorrentColumn.status, value: status.label),
        TorrentSpeedField(
            column: TorrentColumn.downloadSpeed, value: downloadSpeed),
        TorrentEtaField(column: TorrentColumn.eta, value: eta),
        TorrentSpeedField(
            column: TorrentColumn.uploadSpeed, value: uploadSpeed),
      ];

  factory TorrentData.fromRawTransmissionData(RawTransmissionTorrentData data) {
    return TorrentData(
        id: data.id!,
        name: data.name,
        size: data.totalSize ?? 0,
        status: TorrentStatus.fromTransmissionStatus(data.status ?? -1),
        eta: DateTime.fromMillisecondsSinceEpoch(data.eta ?? 0),
        progress: data.percentDone ?? 0);
  }

  TorrentData copyWith({
    int? id,
    String? name,
    int? size,
    TorrentStatus? status,
    DateTime? eta,
    double? progress,
  }) {
    return TorrentData(
      id: id ?? this.id,
      name: name ?? this.name,
      size: size ?? this.size,
      status: status ?? this.status,
      eta: eta ?? this.eta,
      progress: progress ?? this.progress,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'size': size,
      'status': status.toMap(),
      'downloadSpeed': downloadSpeed,
      'uploadSpeed': uploadSpeed,
      'eta': eta?.millisecondsSinceEpoch,
      'progress': progress,
    };
  }

  factory TorrentData.fromMap(Map<String, dynamic> map) {
    return TorrentData(
      id: map['id'] as int,
      name: map['name'] != null ? map['name'] as String : null,
      size: map['size'] as int,
      status: TorrentStatus.fromMap(map['status'] as Map<String, dynamic>),
      eta: map['eta'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['eta'] as int)
          : null,
      progress: map['progress'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory TorrentData.fromJson(String source) =>
      TorrentData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TorrentData(id: $id, name: $name, size: $size, status: $status, downloadSpeed: $downloadSpeed, uploadSpeed: $uploadSpeed, eta: $eta, progress: $progress)';
  }

  @override
  bool operator ==(covariant TorrentData other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.size == size &&
        other.status == status &&
        other.downloadSpeed == downloadSpeed &&
        other.uploadSpeed == uploadSpeed &&
        other.eta == eta &&
        other.id == id &&
        other.progress == progress;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        size.hashCode ^
        status.hashCode ^
        downloadSpeed.hashCode ^
        uploadSpeed.hashCode ^
        eta.hashCode ^
        id.hashCode ^
        progress.hashCode;
  }
}
