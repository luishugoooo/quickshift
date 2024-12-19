// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $GlobalSettingsTableTable extends GlobalSettingsTable
    with TableInfo<$GlobalSettingsTableTable, GlobalSettingsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GlobalSettingsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _globalSettingsMeta =
      const VerificationMeta('globalSettings');
  @override
  late final GeneratedColumnWithTypeConverter<GlobalSettings?, String>
      globalSettings = GeneratedColumn<String>(
              'global_settings', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<GlobalSettings?>(
              $GlobalSettingsTableTable.$converterglobalSettingsn);
  @override
  List<GeneratedColumn> get $columns => [id, globalSettings];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'global_settings_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<GlobalSettingsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    context.handle(_globalSettingsMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GlobalSettingsTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GlobalSettingsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      globalSettings: $GlobalSettingsTableTable.$converterglobalSettingsn
          .fromSql(attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}global_settings'])),
    );
  }

  @override
  $GlobalSettingsTableTable createAlias(String alias) {
    return $GlobalSettingsTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<GlobalSettings, String, String>
      $converterglobalSettings = const GlobalSettingsConverter();
  static JsonTypeConverter2<GlobalSettings?, String?, String?>
      $converterglobalSettingsn =
      JsonTypeConverter2.asNullable($converterglobalSettings);
}

class GlobalSettingsTableData extends DataClass
    implements Insertable<GlobalSettingsTableData> {
  final int id;
  final GlobalSettings? globalSettings;
  const GlobalSettingsTableData({required this.id, this.globalSettings});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || globalSettings != null) {
      map['global_settings'] = Variable<String>($GlobalSettingsTableTable
          .$converterglobalSettingsn
          .toSql(globalSettings));
    }
    return map;
  }

  GlobalSettingsTableCompanion toCompanion(bool nullToAbsent) {
    return GlobalSettingsTableCompanion(
      id: Value(id),
      globalSettings: globalSettings == null && nullToAbsent
          ? const Value.absent()
          : Value(globalSettings),
    );
  }

  factory GlobalSettingsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GlobalSettingsTableData(
      id: serializer.fromJson<int>(json['id']),
      globalSettings: $GlobalSettingsTableTable.$converterglobalSettingsn
          .fromJson(serializer.fromJson<String?>(json['globalSettings'])),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'globalSettings': serializer.toJson<String?>($GlobalSettingsTableTable
          .$converterglobalSettingsn
          .toJson(globalSettings)),
    };
  }

  GlobalSettingsTableData copyWith(
          {int? id,
          Value<GlobalSettings?> globalSettings = const Value.absent()}) =>
      GlobalSettingsTableData(
        id: id ?? this.id,
        globalSettings:
            globalSettings.present ? globalSettings.value : this.globalSettings,
      );
  GlobalSettingsTableData copyWithCompanion(GlobalSettingsTableCompanion data) {
    return GlobalSettingsTableData(
      id: data.id.present ? data.id.value : this.id,
      globalSettings: data.globalSettings.present
          ? data.globalSettings.value
          : this.globalSettings,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GlobalSettingsTableData(')
          ..write('id: $id, ')
          ..write('globalSettings: $globalSettings')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, globalSettings);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GlobalSettingsTableData &&
          other.id == this.id &&
          other.globalSettings == this.globalSettings);
}

class GlobalSettingsTableCompanion
    extends UpdateCompanion<GlobalSettingsTableData> {
  final Value<int> id;
  final Value<GlobalSettings?> globalSettings;
  const GlobalSettingsTableCompanion({
    this.id = const Value.absent(),
    this.globalSettings = const Value.absent(),
  });
  GlobalSettingsTableCompanion.insert({
    this.id = const Value.absent(),
    this.globalSettings = const Value.absent(),
  });
  static Insertable<GlobalSettingsTableData> custom({
    Expression<int>? id,
    Expression<String>? globalSettings,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (globalSettings != null) 'global_settings': globalSettings,
    });
  }

  GlobalSettingsTableCompanion copyWith(
      {Value<int>? id, Value<GlobalSettings?>? globalSettings}) {
    return GlobalSettingsTableCompanion(
      id: id ?? this.id,
      globalSettings: globalSettings ?? this.globalSettings,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (globalSettings.present) {
      map['global_settings'] = Variable<String>($GlobalSettingsTableTable
          .$converterglobalSettingsn
          .toSql(globalSettings.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GlobalSettingsTableCompanion(')
          ..write('id: $id, ')
          ..write('globalSettings: $globalSettings')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $GlobalSettingsTableTable globalSettingsTable =
      $GlobalSettingsTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [globalSettingsTable];
}

typedef $$GlobalSettingsTableTableCreateCompanionBuilder
    = GlobalSettingsTableCompanion Function({
  Value<int> id,
  Value<GlobalSettings?> globalSettings,
});
typedef $$GlobalSettingsTableTableUpdateCompanionBuilder
    = GlobalSettingsTableCompanion Function({
  Value<int> id,
  Value<GlobalSettings?> globalSettings,
});

class $$GlobalSettingsTableTableFilterComposer
    extends Composer<_$AppDatabase, $GlobalSettingsTableTable> {
  $$GlobalSettingsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<GlobalSettings?, GlobalSettings, String>
      get globalSettings => $composableBuilder(
          column: $table.globalSettings,
          builder: (column) => ColumnWithTypeConverterFilters(column));
}

class $$GlobalSettingsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $GlobalSettingsTableTable> {
  $$GlobalSettingsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get globalSettings => $composableBuilder(
      column: $table.globalSettings,
      builder: (column) => ColumnOrderings(column));
}

class $$GlobalSettingsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $GlobalSettingsTableTable> {
  $$GlobalSettingsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<GlobalSettings?, String>
      get globalSettings => $composableBuilder(
          column: $table.globalSettings, builder: (column) => column);
}

class $$GlobalSettingsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $GlobalSettingsTableTable,
    GlobalSettingsTableData,
    $$GlobalSettingsTableTableFilterComposer,
    $$GlobalSettingsTableTableOrderingComposer,
    $$GlobalSettingsTableTableAnnotationComposer,
    $$GlobalSettingsTableTableCreateCompanionBuilder,
    $$GlobalSettingsTableTableUpdateCompanionBuilder,
    (
      GlobalSettingsTableData,
      BaseReferences<_$AppDatabase, $GlobalSettingsTableTable,
          GlobalSettingsTableData>
    ),
    GlobalSettingsTableData,
    PrefetchHooks Function()> {
  $$GlobalSettingsTableTableTableManager(
      _$AppDatabase db, $GlobalSettingsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GlobalSettingsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GlobalSettingsTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GlobalSettingsTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<GlobalSettings?> globalSettings = const Value.absent(),
          }) =>
              GlobalSettingsTableCompanion(
            id: id,
            globalSettings: globalSettings,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<GlobalSettings?> globalSettings = const Value.absent(),
          }) =>
              GlobalSettingsTableCompanion.insert(
            id: id,
            globalSettings: globalSettings,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$GlobalSettingsTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $GlobalSettingsTableTable,
    GlobalSettingsTableData,
    $$GlobalSettingsTableTableFilterComposer,
    $$GlobalSettingsTableTableOrderingComposer,
    $$GlobalSettingsTableTableAnnotationComposer,
    $$GlobalSettingsTableTableCreateCompanionBuilder,
    $$GlobalSettingsTableTableUpdateCompanionBuilder,
    (
      GlobalSettingsTableData,
      BaseReferences<_$AppDatabase, $GlobalSettingsTableTable,
          GlobalSettingsTableData>
    ),
    GlobalSettingsTableData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$GlobalSettingsTableTableTableManager get globalSettingsTable =>
      $$GlobalSettingsTableTableTableManager(_db, _db.globalSettingsTable);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$driftHash() => r'b888e8163a31910b45400cfc5167bd13297caf40';

/// See also [drift].
@ProviderFor(drift)
final driftProvider = Provider<AppDatabase>.internal(
  drift,
  name: r'driftProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$driftHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DriftRef = ProviderRef<AppDatabase>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
