import 'dart:convert';

import 'package:quickshift/models/torrent_status.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class TorrentData {
  final String name;
  final int size;
  final TorrentStatus status;
  final int downloadSpeed;
  final int uploadSpeed;
  final DateTime eta;
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

  List<TorrentField> get fields => [
        TorrentField<String>("Name", name),
        TorrentField<int>("Size", size),
        TorrentField<TorrentStatus>("Status", status),
        TorrentField<int>("Download Speed", downloadSpeed),
        TorrentField<int>("Upload Speed", uploadSpeed),
        TorrentField<DateTime>("ETA", eta),
        TorrentField<double>("Progress", progress),
      ];

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
      'eta': eta.millisecondsSinceEpoch,
      'progress': progress,
    };
  }

  factory TorrentData.fromMap(Map<String, dynamic> map) {
    return TorrentData(
      name: map['name'] as String,
      size: map['size'] as int,
      status: TorrentStatus.fromMap(map['status'] as Map<String, dynamic>),
      downloadSpeed: map['downloadSpeed'] as int,
      uploadSpeed: map['uploadSpeed'] as int,
      eta: DateTime.fromMillisecondsSinceEpoch(map['eta'] as int),
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

class TorrentField<T> {
  final String label;
  final T value;
  const TorrentField(this.label, this.value);
}
