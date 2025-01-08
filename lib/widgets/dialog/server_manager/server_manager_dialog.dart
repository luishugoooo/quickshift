import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quickshift/data/database/servers/servers.dart';
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
  late List<ServerConfig> servers;

  @override
  void initState() {
    servers = ref.read(storedServersProvider);
    super.initState();
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
                            return ListTile(
                              title: const Text("Add new server"),
                              onTap: () {
                                ref
                                    .read(storedServersProvider.notifier)
                                    .add(ServerConfig());
                              },
                            );
                          }

                          final server = servers[index];
                          return ListTile(
                            title: Text(server.name),
                            subtitle: Text(server.host),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                ref
                                    .read(storedServersProvider.notifier)
                                    .remove(server);
                              },
                            ),
                          );
                        },
                      )
                    : const Center(child: Text("No servers")),
              ),
              const VerticalDivider(),
              Expanded(
                  flex: 2,
                  child: ServerEditor(
                    config: selected != null ? servers[selected!] : null,
                  ))
            ],
          ),
        ));
  }
}
