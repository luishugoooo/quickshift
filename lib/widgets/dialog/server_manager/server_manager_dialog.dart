import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quickshift/data/database/servers/servers.dart';
import 'package:quickshift/extensions/theme.dart';
import 'package:quickshift/models/backends/server_config.dart';
import 'package:quickshift/widgets/dialog/default_dialog_frame.dart';
import 'package:quickshift/widgets/dialog/server_manager/server_editor.dart';

class ServerManagerDialog extends ConsumerStatefulWidget {
  const ServerManagerDialog({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ServerManagerDialogState();
}

class _ServerManagerDialogState extends ConsumerState<ServerManagerDialog> {
  Widget _buildAddServerButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: TextButton(
        onPressed: () {
          setState(() {
            ref.read(storedServersProvider.notifier).set(ServerConfig.empty());
          });
        },
        child: const Text("Add a server"),
      ),
    );
  }

  int? selected;
  @override
  Widget build(BuildContext context) {
    final servers = ref.watch(storedServersProvider);

    return DefaultDialogFrame(
        padding: EdgeInsets.zero,
        title: "Servers",
        body: SizedBox(
          height: 600,
          child: Row(
            children: [
              Expanded(
                child: servers.isNotEmpty
                    ? ListView.builder(
                        itemCount: servers.length + 1,
                        itemBuilder: (context, index) {
                          if (index == servers.length) {
                            return _buildAddServerButton();
                          }

                          final server = servers[index];
                          return ListTile(
                            contentPadding:
                                const EdgeInsets.only(left: 16, right: 6),
                            title: server.name.isNotEmpty
                                ? Text(server.name)
                                : Text("Unnamed",
                                    style: TextStyle(
                                        color: context
                                            .theme.colorScheme.tertiary)),
                            subtitle: server.host.isNotEmpty
                                ? Text(server.host)
                                : null,
                            selected: selected == index,
                            selectedTileColor:
                                context.theme.colorScheme.primaryContainer,
                            onTap: () {
                              setState(() {
                                selected = index;
                              });
                              print("Selected $index");
                            },
                            trailing: IconButton(
                              icon: FaIcon(
                                FontAwesomeIcons.trash,
                                size: 16,
                                color: context.theme.colorScheme.error,
                              ),
                              onPressed: () {
                                ref
                                    .read(storedServersProvider.notifier)
                                    .remove(server);
                              },
                            ),
                          );
                        },
                      )
                    : Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: _buildAddServerButton(),
                          )
                        ],
                      ),
              ),
              const VerticalDivider(
                width: 0,
              ),
              Expanded(
                  flex: 2,
                  child: ServerEditor(
                    key: ValueKey(selected),
                    onSave: (server) {
                      ref.read(storedServersProvider.notifier).set(server);
                    },
                    config: selected != null ? servers[selected!] : null,
                  ))
            ],
          ),
        ));
  }
}
