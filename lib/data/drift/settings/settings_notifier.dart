import 'package:drift/drift.dart';
import 'package:quickshift/data/drift/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import "settings.dart";

part 'settings_notifier.g.dart';

@Riverpod(keepAlive: true)
class Settings extends _$Settings {
  @override
  GlobalSettings build() {
    _init();
    return const GlobalSettings.defaults();
  }

  Future<GlobalSettings> _fetch() async {
    final db = ref.read(driftProvider);
    final settings = (await db.select(db.globalSettingsTable).getSingleOrNull())
        ?.globalSettings;
    return settings ?? const GlobalSettings.defaults();
  }

  Future<void> _init() async {
    state = await _fetch();
    return;
  }

  Future<void> updateSettings(GlobalSettings s) async {
    final db = ref.read(driftProvider);
    await db.into(db.globalSettingsTable).insertOnConflictUpdate(
        GlobalSettingsTableCompanion.insert(
            id: const Value(0), globalSettings: Value(s)));
    state = s;
  }

  Future<void> setSyncFilters(bool value) async {
    final newSettings = const GlobalSettings.defaults()
        .copyWith(synchronizeFiltersAcrossTabs: value);
    await updateSettings(newSettings);
  }

  Future<void> setFetchInterval(int value) async {
    final newSettings =
        const GlobalSettings.defaults().copyWith(fetchInterval: value);
    await updateSettings(newSettings);
  }
}
