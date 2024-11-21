import 'package:flutter/material.dart';

class TestBorder extends StatelessWidget {
  final Widget child;
  const TestBorder({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.red,
            width: 1,
          ),
        ),
        child: child);
  }
}
