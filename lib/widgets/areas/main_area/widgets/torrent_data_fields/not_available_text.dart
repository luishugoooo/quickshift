import 'package:flutter/material.dart';

class NotAvailableText extends StatelessWidget {
  const NotAvailableText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'N/A',
      style: TextStyle(
        color: Colors.grey[400],
      ),
    );
  }
}
