import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:quickshift/const/color.dart';
import 'package:quickshift/extensions/theme.dart';
import 'package:quickshift/state/tabs.dart' as tabs;

class TitleTab extends ConsumerStatefulWidget {
  final bool isSelected;
  final tabs.Tab tab;
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  const TitleTab({
    super.key,
    this.isSelected = false,
    required this.title,
    required this.icon,
    required this.tab,
    required this.onTap,
  });

  @override
  ConsumerState<TitleTab> createState() => _TitleTabState();
}

class _TitleTabState extends ConsumerState<TitleTab> {
  bool hovering = false;
  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;
    return Flexible(
      child: Container(
        height: double.infinity,
        constraints: const BoxConstraints(minWidth: 100, maxWidth: 250),
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
        child: InkWell(
          mouseCursor: SystemMouseCursors.basic,
          onHover: (value) {
            setState(() {
              hovering = value;
            });
          },
          onTap: () {
            widget.onTap();
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FaIcon(
                size: 20,
                widget.icon,
                color: colorScheme.secondary,
              ),
              const Gap(10),
              Expanded(
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  widget.title,
                  style: const TextStyle(),
                ),
              ),
              //const Expanded(child: SizedBox()),
              IconButton(
                  onPressed: () {
                    ref.read(tabs.tabsProvider.notifier).closeTab(widget.tab);
                  },
                  icon: const FaIcon(
                    FontAwesomeIcons.xmark,
                    size: 16,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
