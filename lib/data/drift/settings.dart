// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:drift/drift.dart';

class GlobalSettingsTable extends Table {
  late final id = integer()();
  late final globalSettings =
      text().map(const GlobalSettingsConverter()).nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class GlobalSettings {
  /// The interval in milliseconds to fetch data from the backend.
  final int fetchInterval;
  final bool synchronizeFiltersAcrossTabs;

  const GlobalSettings(this.fetchInterval, this.synchronizeFiltersAcrossTabs);
  const GlobalSettings.defaults()
      : fetchInterval = 3000,
        synchronizeFiltersAcrossTabs = false;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fetchInterval': fetchInterval,
      'synchronizeFiltersAcrossTabs': synchronizeFiltersAcrossTabs,
    };
  }

  factory GlobalSettings.fromMap(Map<String, dynamic> map) {
    return GlobalSettings(
      map['fetchInterval'] as int,
      map['synchronizeFiltersAcrossTabs'] as bool,
    );
  }

  @override
  String toString() {
    return 'GlobalSettings(fetchInterval: $fetchInterval, synchronizeFiltersAcrossTabs: $synchronizeFiltersAcrossTabs)';
  }

  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GlobalSettings &&
        other.fetchInterval == fetchInterval &&
        other.synchronizeFiltersAcrossTabs == synchronizeFiltersAcrossTabs;
  }

  @override
  int get hashCode =>
      fetchInterval.hashCode ^ synchronizeFiltersAcrossTabs.hashCode;

  GlobalSettings copyWith({
    int? fetchInterval,
    bool? synchronizeFiltersAcrossTabs,
  }) {
    return GlobalSettings(
      fetchInterval ?? this.fetchInterval,
      synchronizeFiltersAcrossTabs ?? this.synchronizeFiltersAcrossTabs,
    );
  }
}

class GlobalSettingsConverter extends TypeConverter<GlobalSettings, String>
    with JsonTypeConverter<GlobalSettings, String> {
  const GlobalSettingsConverter();
  @override
  GlobalSettings fromSql(String fromDb) {
    return GlobalSettings.fromMap(json.decode(fromDb) as Map<String, dynamic>);
  }

  @override
  String toSql(GlobalSettings value) {
    return value.toJson();
  }
}
