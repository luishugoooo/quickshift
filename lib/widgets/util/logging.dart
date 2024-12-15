import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'logging.g.dart';

@riverpod
class Logging extends _$Logging {
  @override
  List<String> build() {
    return [];
  }

  void addLog(String l) {
    state = [...state, l];
  }
}
