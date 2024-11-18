/* // ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:quickshift/models/torrent_filter.dart';

part 'ui.g.dart';

class UIState {
  final TorrentStatus selectedFilter;

  UIState({
    required this.selectedFilter,
  });

  UIState copyWith({
    TorrentStatus? selectedFilter,
  }) {
    return UIState(
      selectedFilter: selectedFilter ?? this.selectedFilter,
    );
  }
}

@riverpod
class UIStateNotifier extends _$UIStateNotifier {
  @override
  UIState build(int serverId) {
    return UIState(selectedFilter: TorrentStatus.all);
  }

  void setSelectedFilter(TorrentStatus filter) {
    state = state.copyWith(selectedFilter: filter);
  }
}
 */