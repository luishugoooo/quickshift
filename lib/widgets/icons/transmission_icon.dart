import 'package:flutter/material.dart';

class TransmissionIcon extends StatelessWidget {
  const TransmissionIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/icons/transmission.png",
      fit: BoxFit.contain,
    );
  }
}
