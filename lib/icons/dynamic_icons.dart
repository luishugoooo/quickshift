import 'dart:io';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class _DynamicIconGetters {
  static IconData getIcon(DynamicIcons icon) {
    if (Platform.isWindows) {
      return _windowsIcons[icon]!;
    }
    return _defaultIcons[icon]!;
  }

  static const Map<DynamicIcons, IconData> _windowsIcons = {
    DynamicIcons.refresh: FluentIcons.arrow_clockwise_48_regular,
    DynamicIcons.addSquare: FluentIcons.add_square_48_regular,
    DynamicIcons.server: FluentIcons.server_24_regular,
    DynamicIcons.add: FluentIcons.add_24_regular,
    DynamicIcons.close: FluentIcons.dismiss_24_regular,
    DynamicIcons.list: FluentIcons.list_28_regular,
    DynamicIcons.stop: FluentIcons.stop_24_regular,
    DynamicIcons.verify: FluentIcons.fingerprint_48_regular,
    DynamicIcons.download: FluentIcons.arrow_download_48_regular,
    DynamicIcons.seeding: FluentIcons.arrow_upload_32_regular,
    DynamicIcons.play: FluentIcons.play_48_regular,
  };

  static const Map<DynamicIcons, IconData> _defaultIcons = {
    DynamicIcons.addSquare: Icons.add,
    DynamicIcons.server: Icons.dns,
    DynamicIcons.add: Icons.add,
    DynamicIcons.close: Icons.close,
    DynamicIcons.list: Icons.list,
    DynamicIcons.stop: Icons.stop,
    DynamicIcons.verify: Icons.fingerprint,
    DynamicIcons.download: Icons.download,
    DynamicIcons.seeding: Icons.arrow_upward,
    DynamicIcons.refresh: Icons.refresh,
    DynamicIcons.play: Icons.play_arrow_rounded,
  };
}

enum DynamicIcons {
  addSquare,
  server,
  add,
  close,
  list,
  stop,
  verify,
  download,
  refresh,
  play,
  seeding;

  IconData getIconData() {
    return _DynamicIconGetters.getIcon(this);
  }
}
