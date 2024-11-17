import 'dart:io';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class DynamicIcons {
  static IconData get addSquare {
    if (Platform.isWindows) {
      return FluentIcons.add_square_48_regular;
    }
    return Icons.add;
  }

  static IconData get server {
    if (Platform.isWindows) {
      return FluentIcons.server_24_regular;
    }
    return Icons.dns;
  }

  static IconData get add {
    if (Platform.isWindows) {
      return FluentIcons.add_24_regular;
    }
    return Icons.add;
  }

  static IconData get close {
    if (Platform.isWindows) {
      return FluentIcons.dismiss_24_regular;
    }
    return Icons.close;
  }
}
