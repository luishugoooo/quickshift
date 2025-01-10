import 'package:flutter/material.dart';
import 'package:quickshift/extensions/theme.dart';
import 'package:quickshift/models/backends/server_config.dart';
import 'package:quickshift/models/backends/torrent_client_type.dart';
import 'package:quickshift/widgets/buttons/default_elevated_button.dart';

class ServerEditor extends StatefulWidget {
  final ServerConfig? config;
  final void Function(ServerConfig server) onSave;
  final void Function(ServerConfig server)? onDelete;

  const ServerEditor(
      {super.key,
      required this.config,
      required this.onSave,
      required this.onDelete});

  @override
  State<ServerEditor> createState() => _ServerEditorState();
}

class _ServerEditorState extends State<ServerEditor> {
  late ServerConfig? config = widget.config;

  late TextEditingController nameController;
  late TextEditingController hostController;
  late TextEditingController portController;
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  late TextEditingController pathController;
  late TextEditingController httpsController;
  late TextEditingController clientTypeController;

  @override
  void initState() {
    super.initState();
    initController(config);
  }

  void initController(ServerConfig? conf) {
    nameController = TextEditingController(text: conf?.name);
    hostController = TextEditingController(text: conf?.host);
    portController = TextEditingController(text: conf?.port.toString());
    usernameController = TextEditingController(text: conf?.username);
    passwordController = TextEditingController(text: conf?.password);
    pathController = TextEditingController(text: conf?.path);
    httpsController = TextEditingController(text: conf?.https.toString());
    clientTypeController =
        TextEditingController(text: conf?.clientType.toString());
  }

  @override
  void dispose() {
    nameController.dispose();
    hostController.dispose();
    portController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    pathController.dispose();
    httpsController.dispose();
    clientTypeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (config == null) {
      return const Center(child: Text("Select a server"));
    }
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                spacing: 12,
                children: [
                  Row(
                    children: [
                      Text(
                        "Presets",
                        style: context.theme.textTheme.bodyLarge,
                      ),
                      const Spacer(),
                      ...TorrentClientType.values.map(
                        (e) {
                          return IconButton(
                            onPressed: () {
                              setState(() {
                                config = switch (e) {
                                  TorrentClientType.qbittorrent =>
                                    ServerConfig.qbittorrent(
                                        name: config?.name ?? "",
                                        host: config?.host ?? "",
                                        id: config?.id),
                                  TorrentClientType.transmission =>
                                    ServerConfig.transmission(
                                        name: config?.name ?? "",
                                        host: config?.host ?? "",
                                        id: config?.id),
                                };
                                initController(config);
                              });
                            },
                            icon: SizedBox(
                                width: 25, child: FittedBox(child: e.icon)),
                          );
                        },
                      )
                    ],
                  ),
                  InputDecorator(
                    decoration: const InputDecoration(
                      labelText: "Client Type",
                      border: OutlineInputBorder(),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<TorrentClientType>(
                        value: config?.clientType,
                        onChanged: (TorrentClientType? newValue) {
                          setState(() {
                            config = config!.copyWith(clientType: newValue);
                          });
                        },
                        isDense: true,
                        items: TorrentClientType.values
                            .map((TorrentClientType type) {
                          return DropdownMenuItem<TorrentClientType>(
                            value: type,
                            child: Text(type.toString()),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: "Name",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        config = config!.copyWith(name: value);
                      });
                    },
                  ),
                  TextField(
                    controller: hostController,
                    decoration: const InputDecoration(
                      labelText: "Host",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        config = config!.copyWith(host: value);
                      });
                    },
                  ),
                  TextField(
                    controller: portController,
                    decoration: const InputDecoration(
                      labelText: "Port",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        config = config!.copyWith(port: int.tryParse(value));
                      });
                    },
                  ),
                  TextField(
                    controller: usernameController,
                    decoration: const InputDecoration(
                      labelText: "Username",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        config = config!.copyWith(username: value);
                      });
                    },
                  ),
                  TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        config = config!.copyWith(password: value);
                      });
                    },
                  ),
                  TextField(
                    controller: pathController,
                    decoration: const InputDecoration(
                      labelText: "Path",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        config = config!.copyWith(path: value);
                      });
                    },
                  ),
                  CheckboxListTile.adaptive(
                    value: config?.https ?? false,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 2),
                    title: const Text("Use HTTPS"),
                    subtitle:
                        const Text("Disable if you get connection errors"),
                    onChanged: (value) {
                      setState(() {
                        config = config!.copyWith(https: value);
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        const Divider(
          height: 0,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            spacing: 8,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  widget.onDelete?.call(config!);
                },
                child: Text("Delete",
                    style: TextStyle(
                        color: context.theme.colorScheme.error,
                        fontWeight: FontWeight.w600)),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  widget.onSave(config!);
                },
                child: const Text("Cancel"),
              ),
              TextButton(
                onPressed: () {
                  widget.onSave(config!);
                },
                child: const Text("Save"),
              ),
              DefaultElevatedButton(
                onPressed: () {
                  widget.onSave(config!);
                  Navigator.of(context).pop();
                },
                text: "Okay",
              )
            ],
          ),
        )
      ],
    );
  }
}
