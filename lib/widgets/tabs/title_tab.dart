import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:quickshift/const/color.dart';
import 'package:quickshift/extensions/theme.dart';

class TitleTab extends StatelessWidget {
  final bool isSelected;
  final IconData icon;
  final String title;
  const TitleTab(
      {super.key,
      this.isSelected = false,
      required this.title,
      required this.icon});
  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;
    return Container(
      width: 200,
      height: double.infinity,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          color: isSelected ? tabColorDark : null),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: colorScheme.secondary,
          ),
          const Gap(5),
          Text(
            title,
            style: const TextStyle(),
          )
        ],
      ),
    );
  }
}
