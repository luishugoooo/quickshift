import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'logging.g.dart';

class Log {
  final String log;
  final DateTime time;

  Log(this.log, this.time);
}

@riverpod
class Logging extends _$Logging {
  @override
  List<Log> build() {
    return [];
  }

  void log(String l) {
    state = [...state, Log(l, DateTime.now())];
  }
}
