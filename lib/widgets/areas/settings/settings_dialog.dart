import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hold_down_button/hold_down_button.dart';
import 'package:quickshift/data/drift/settings/settings.dart';
import 'package:quickshift/data/drift/settings/settings_notifier.dart';
import 'package:quickshift/extensions/theme.dart';
import 'package:quickshift/widgets/buttons/default_elevated_button.dart';
import 'package:quickshift/widgets/dialog/default_dialog_frame.dart';

class SettingsDialog extends ConsumerStatefulWidget {
  final GlobalSettings settings;
  const SettingsDialog({super.key, required this.settings});

  @override
  ConsumerState<SettingsDialog> createState() => _SettingsDialogState();
}

class _SettingsDialogState extends ConsumerState<SettingsDialog> {
  Widget buildSettingsRow(
      {required BuildContext context,
      required String title,
      required Widget action}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: SizedBox(
        height: 30,
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: context.theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
            action
          ],
        ),
      ),
    );
  }

  late GlobalSettings settings;

  @override
  void initState() {
    settings = widget.settings;
    super.initState();
  }

  void setSettings(GlobalSettings newSettings) {
    setState(() {
      settings = newSettings;
    });
  }

  void applySettings() {
    ref.read(settingsProvider.notifier).updateSettings(settings);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultDialogFrame(
      title: "Application Settings",
      body: Column(
        children: [
          buildSettingsRow(
              context: context,
              title: "Fetch interval for torrent data",
              action: NumberSettingBox(
                  initalValue: settings.fetchInterval,
                  max: 10000,
                  label: "ms",
                  min: 100,
                  onChanged: (value) =>
                      setSettings(settings.copyWith(fetchInterval: value)))),
          buildSettingsRow(
              context: context,
              title: "Synchronize torrent filters across tabs",
              action: FittedBox(
                child: Switch.adaptive(
                  value: settings.synchronizeFiltersAcrossTabs,
                  onChanged: (value) => setSettings(
                      settings.copyWith(synchronizeFiltersAcrossTabs: value)),
                ),
              ))
        ],
      ),
      actions: [
        DefaultElevatedButton(
            onPressed: () {
              applySettings();
              context.pop();
            },
            text: "Okay")
      ],
    );
  }
}

class NumberSettingBox extends StatefulWidget {
  final int initalValue;
  final Function(int value) onChanged;
  final int min;
  final int? max;
  final String? label;

  const NumberSettingBox(
      {super.key,
      required this.initalValue,
      required this.onChanged,
      this.min = 0,
      this.max,
      this.label});

  @override
  State<NumberSettingBox> createState() => _NumberSettingBoxState();
}

class _NumberSettingBoxState extends State<NumberSettingBox> {
  late final TextEditingController controller;
  late int value;

  @override
  initState() {
    controller = TextEditingController(text: widget.initalValue.toString());
    value = widget.initalValue;
    controller.addListener(
      () => value = int.tryParse(controller.text) ?? value,
    );
    super.initState();
  }

  void setValue(void Function(int value) set, int value,
      {bool updateController = false}) {
    setState(() {
      if (value < widget.min) {
        value = widget.min;
      }
      if (widget.max != null && value > widget.max!) {
        value = widget.max!;
      }

      set(value);
      if (!updateController) return;
      controller.text = value.toString();
    });
  }

  Widget _buildArrowButton(
      {required BuildContext context,
      required IconData icon,
      bool active = false,
      required VoidCallback onPressed}) {
    return HoldDownButton(
      onHoldDown: onPressed,
      child: InkWell(
        borderRadius: BorderRadius.circular(4),
        onTap: active ? onPressed : null,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.0),
          child: FaIcon(
            color: active
                ? context.theme.colorScheme.onSurfaceVariant
                : Colors.grey[800],
            icon,
            size: 16,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 150,
        child: Row(
          children: [
            if (widget.label != null)
              Text("(${widget.label})",
                  style: TextStyle(
                      color: context.theme.colorScheme.onSurfaceVariant)),
            const Gap(5),
            Expanded(
              child: TextField(
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: context.theme.colorScheme.onSurfaceVariant),
                controller: controller,
                textAlignVertical: const TextAlignVertical(y: -0.61),
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(20)),
                onChanged: (v) =>
                    setValue(widget.onChanged, int.tryParse(v) ?? value),
              ),
            ),
            const Gap(5),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: _buildArrowButton(
                    context: context,
                    active: value < (widget.max ?? value + 1),
                    icon: FontAwesomeIcons.caretUp,
                    onPressed: () => setValue(widget.onChanged, value + 100,
                        updateController: true),
                  ),
                ),
                Expanded(
                  child: _buildArrowButton(
                      context: context,
                      active: value > widget.min,
                      icon: FontAwesomeIcons.caretDown,
                      onPressed: () => setValue(widget.onChanged, value - 100,
                          updateController: true)),
                )
              ],
            )
          ],
        ));
  }
}
