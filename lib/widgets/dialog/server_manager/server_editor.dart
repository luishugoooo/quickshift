import 'package:flutter/material.dart';
import 'package:quickshift/models/backends/server_config.dart';
import 'package:quickshift/models/backends/torrent_client_type.dart';

class ServerEditor extends StatefulWidget {
  final ServerConfig? config;
  final void Function(ServerConfig server) onSave;
  const ServerEditor({super.key, required this.config, required this.onSave});

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
    nameController = TextEditingController(text: config?.name);
    hostController = TextEditingController(text: config?.host);
    portController = TextEditingController(text: config?.port.toString());
    usernameController = TextEditingController(text: config?.username);
    passwordController = TextEditingController(text: config?.password);
    pathController = TextEditingController(text: config?.path);
    httpsController = TextEditingController(text: config?.https.toString());
    clientTypeController =
        TextEditingController(text: config?.clientType?.toString());
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(labelText: "Name"),
            onChanged: (value) {
              setState(() {
                config = config!.copyWith(name: value);
              });
            },
          ),
          TextField(
            controller: hostController,
            decoration: const InputDecoration(labelText: "Host"),
            onChanged: (value) {
              setState(() {
                config = config!.copyWith(host: value);
              });
            },
          ),
          TextField(
            controller: portController,
            decoration: const InputDecoration(labelText: "Port"),
            onChanged: (value) {
              setState(() {
                config = config!.copyWith(port: int.tryParse(value));
              });
            },
          ),
          TextField(
            controller: usernameController,
            decoration: const InputDecoration(labelText: "Username"),
            onChanged: (value) {
              setState(() {
                config = config!.copyWith(username: value);
              });
            },
          ),
          TextField(
            controller: passwordController,
            decoration: const InputDecoration(labelText: "Password"),
            onChanged: (value) {
              setState(() {
                config = config!.copyWith(password: value);
              });
            },
          ),
          TextField(
            controller: pathController,
            decoration: const InputDecoration(labelText: "Path"),
            onChanged: (value) {
              setState(() {
                config = config!.copyWith(path: value);
              });
            },
          ),
          TextField(
            controller: httpsController,
            decoration: const InputDecoration(labelText: "HTTPS"),
            onChanged: (value) {
              setState(() {
                config = config!.copyWith(https: value.toLowerCase() == 'true');
              });
            },
          ),
          DropdownButton<TorrentClientType>(
            value: config?.clientType,
            onChanged: (TorrentClientType? newValue) {
              setState(() {
                config = config!.copyWith(clientType: newValue);
              });
            },
            items: TorrentClientType.values.map((TorrentClientType type) {
              return DropdownMenuItem<TorrentClientType>(
                value: type,
                child: Text(type.toString().split('.').last),
              );
            }).toList(),
          ),
          ElevatedButton(
            onPressed: () {
              widget.onSave(config!);
            },
            child: const Text("Save"),
          )
        ],
      ),
    );
  }
}
