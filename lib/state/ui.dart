// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:quickshift/models/torrent_filter.dart';

part 'ui.g.dart';

class UIState {
  final TorrentFilter selectedFilter;

  UIState({
    required this.selectedFilter,
  });

  UIState copyWith({
    TorrentFilter? selectedFilter,
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
    return UIState(selectedFilter: TorrentFilter.all);
  }

  void setSelectedFilter(TorrentFilter filter) {
    state = state.copyWith(selectedFilter: filter);
  }
}
