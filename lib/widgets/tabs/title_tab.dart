import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:quickshift/const/color.dart';
import 'package:quickshift/extensions/theme.dart';

class TitleTab extends StatefulWidget {
  final bool isSelected;
  final IconData icon;
  final String title;
  final VoidCallback? onTap;
  const TitleTab(
      {super.key,
      this.isSelected = false,
      required this.title,
      required this.icon,
      this.onTap});

  @override
  State<TitleTab> createState() => _TitleTabState();
}

class _TitleTabState extends State<TitleTab> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;
    return InkWell(
      mouseCursor: SystemMouseCursors.basic,
      onHover: (value) {
        setState(() {
          hovering = value;
        });
      },
      onTap: widget.onTap,
      child: Container(
        width: 200,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 6),
        margin: const EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
                bottomRight: Radius.circular(-10)),
            color: widget.isSelected
                ? tabColorDark
                : hovering
                    ? tabColorDark.withOpacity(0.5)
                    : null),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              widget.icon,
              color: colorScheme.secondary,
            ),
            const Gap(5),
            Text(
              widget.title,
              style: const TextStyle(),
            )
          ],
        ),
      ),
    );
  }
}
