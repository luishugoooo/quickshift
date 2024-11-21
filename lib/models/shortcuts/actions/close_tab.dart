import 'package:flutter/material.dart';
import 'package:quickshift/models/shortcuts/intents/close_tab.dart';

class CloseTabAction extends Action<CloseTabIntent> {
  final Function onInvoke;

  CloseTabAction({required this.onInvoke});

  @override
  void invoke(CloseTabIntent intent) {
    onInvoke();
  }
}
