import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:quickshift/const/color.dart';
import 'package:quickshift/data/state/tabs.dart' as tabs;
import 'package:quickshift/extensions/theme.dart';

class TitleTab extends ConsumerStatefulWidget {
  final bool isSelected;
  final tabs.Tab tab;
  final Widget icon;
  final String title;
  final VoidCallback onTap;
  final bool isOnly;
  const TitleTab({
    super.key,
    this.isSelected = false,
    required this.title,
    required this.icon,
    required this.tab,
    required this.onTap,
    this.isOnly = false,
  });

  @override
  ConsumerState<TitleTab> createState() => _TitleTabState();
}

class _TitleTabState extends ConsumerState<TitleTab> {
  Offset myPointerDragAnchorStrategy(
      Draggable<Object> draggable, BuildContext context, Offset position) {
    return const Offset(10, 0);
  }

  bool hovering = false;
  static const minWidth = 100.0;
  static const maxWidth = 250.0;
  bool insertingLeft = false;
  bool insertingRight = false;

  Widget buildInsertIndicator(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 4,
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: context.theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(6)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (insertingLeft) buildInsertIndicator(context),
        Draggable(
          dragAnchorStrategy: myPointerDragAnchorStrategy,
          data: widget.tab,
          hitTestBehavior: HitTestBehavior.translucent,
          feedback: Material(
              borderRadius: const BorderRadius.all(Radius.circular(6)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                child: Row(
                  children: [
                    SizedBox(width: 25, child: widget.icon),
                    Text(
                      widget.title,
                    ),
                  ],
                ),
              )),
          child: DragTarget(
            onMove: (details) {
              RenderBox box = context.findRenderObject() as RenderBox;
              final position = box.globalToLocal(details.offset);
              if (details.data == widget.tab) return;

              if (position.dx < (box.size.width / 2)) {
                setState(() {
                  insertingLeft = true;
                  insertingRight = false;
                });
              } else {
                setState(() {
                  insertingLeft = false;
                  insertingRight = true;
                });
              }
            },
            onLeave: (data) {
              setState(() {
                insertingLeft = false;
                insertingRight = false;
              });
            },
            onAcceptWithDetails: (details) {
              RenderBox box = context.findRenderObject() as RenderBox;
              final position = box.globalToLocal(details.offset);

              ref.read(tabs.tabsProvider.notifier).moveTab(
                    details.data as tabs.Tab,
                    widget.tab,
                    position.dx > (box.size.width / 2),
                  );
              print("insert at ${position.dx} ${box.size.width}");
              setState(() {
                insertingLeft = false;
                insertingRight = false;
              });
            },
            builder: (context, candidateData, rejectedData) => Container(
              height: double.infinity,
              constraints:
                  const BoxConstraints(minWidth: minWidth, maxWidth: maxWidth),
              padding: const EdgeInsets.symmetric(horizontal: 6),
              margin: const EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                      bottomRight: Radius.circular(0)),
                  color: widget.isSelected
                      ? tabColorDark
                      : hovering
                          ? tabColorDark.withAlpha((0.5 * 255).toInt())
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
                    SizedBox(width: 25, child: Center(child: widget.icon)),
                    const Gap(10),
                    Expanded(
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        widget.title,
                        style: const TextStyle(),
                      ),
                    ),
                    IconButton(
                        onPressed: !widget.isOnly
                            ? () {
                                ref
                                    .read(tabs.tabsProvider.notifier)
                                    .closeTab(widget.tab);
                              }
                            : null,
                        icon: const FaIcon(
                          FontAwesomeIcons.xmark,
                          size: 16,
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
        if (insertingRight) buildInsertIndicator(context)
      ],
    ));
  }
}
