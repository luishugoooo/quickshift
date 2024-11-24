import 'dart:convert';

import 'package:dart_transmission_rpc/model.dart';
import 'package:dart_transmission_rpc/utils.dart' as transmission_utils;
import 'package:quickshift/models/torrent/torrent_column.dart';
import 'package:quickshift/models/torrent_status.dart';
import 'package:quickshift/widgets/areas/main_area/widgets/torrent_data_fields/torrent_data_field.dart';
import 'package:quickshift/widgets/areas/main_area/widgets/torrent_data_fields/torrent_eta_field.dart';
import 'package:quickshift/widgets/areas/main_area/widgets/torrent_data_fields/torrent_speed_field.dart';

import '../../widgets/areas/main_area/widgets/torrent_data_fields/torrent_progress_field.dart';
import '../../widgets/areas/main_area/widgets/torrent_data_fields/torrent_string_field.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class TorrentData {
  final String? name;
  final int size;
  final TorrentStatus status;
  final int downloadSpeed;
  final int uploadSpeed;
  final DateTime? eta;
  final double progress;
  const TorrentData({
    required this.name,
    required this.size,
    required this.status,
    required this.downloadSpeed,
    required this.uploadSpeed,
    required this.eta,
    required this.progress,
  });

  ///How to add a new field:
  ///1. Create a new field widget class in widgets/areas/main_area/widgets/torrent_data_fields or use an existing one
  ///2. Add the data property to the TorrentData [this] class
  ///3. Add a corresponding Column to the TorrentColumn enum
  ///4. Add the field to the fields getter
  List<TorrentDataField> get fields => [
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

  factory TorrentData.fromTransmissionTorrentInfo(TorrentInfo torrent) {
    return TorrentData(
        name: torrent.name,
        size: torrent.totalSize?.toInt() ?? 0,
        status: TorrentStatus.fromTransmissionStatus(
            torrent.status ?? transmission_utils.TorrentStatus.unknown),
        downloadSpeed: torrent.rateDownload?.toInt() ?? 0,
        uploadSpeed: torrent.rateUpload?.toInt() ?? 0,
        eta: torrent.eta != null
            ? DateTime.now().add(Duration(seconds: torrent.eta as int))
            : null,
        progress: torrent.percentDone?.toDouble() ?? 0);
  }

  TorrentData copyWith({
    String? name,
    int? size,
    TorrentStatus? status,
    int? downloadSpeed,
    int? uploadSpeed,
    DateTime? eta,
    double? progress,
  }) {
    return TorrentData(
      name: name ?? this.name,
      size: size ?? this.size,
      status: status ?? this.status,
      downloadSpeed: downloadSpeed ?? this.downloadSpeed,
      uploadSpeed: uploadSpeed ?? this.uploadSpeed,
      eta: eta ?? this.eta,
      progress: progress ?? this.progress,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
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
      name: map['name'] != null ? map['name'] as String : null,
      size: map['size'] as int,
      status: TorrentStatus.fromMap(map['status'] as Map<String, dynamic>),
      downloadSpeed: map['downloadSpeed'] as int,
      uploadSpeed: map['uploadSpeed'] as int,
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
    return 'TorrentData(name: $name, size: $size, status: $status, downloadSpeed: $downloadSpeed, uploadSpeed: $uploadSpeed, eta: $eta, progress: $progress)';
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
        progress.hashCode;
  }
}
