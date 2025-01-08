import 'package:flutter/material.dart';
import 'package:quickshift/models/backends/server_config.dart';

class ServerEditor extends StatefulWidget {
  final ServerConfig? config;
  final VoidCallback? onSave;
  const ServerEditor({super.key, required this.config, this.onSave});

  @override
  State<ServerEditor> createState() => _ServerEditorState();
}

class _ServerEditorState extends State<ServerEditor> {
  late ServerConfig? config = widget.config;

  @override
  Widget build(BuildContext context) {
    if (config == null) {
      return const Center(child: Text("Select a server"));
    }
    return Column(
      children: [
        TextField(
          controller: TextEditingController(text: config!.name),
          decoration: const InputDecoration(labelText: "Name"),
          onChanged: (value) {
            setState(() {
              config = config!.copyWith(name: value);
            });
          },
        ),
        TextField(
          controller: TextEditingController(text: config!.host),
          decoration: const InputDecoration(labelText: "Host"),
          onChanged: (value) {
            setState(() {
              config = config!.copyWith(host: value);
            });
          },
        ),
        TextField(
          controller: TextEditingController(text: config!.port.toString()),
          decoration: const InputDecoration(labelText: "Port"),
          onChanged: (value) {
            setState(() {
              config = config!.copyWith(port: int.parse(value));
            });
          },
        ),
        TextField(
          controller: TextEditingController(text: config!.username),
          decoration: const InputDecoration(labelText: "Username"),
          onChanged: (value) {
            setState(() {
              config = config!.copyWith(username: value);
            });
          },
        ),
        TextField(
          controller: TextEditingController(text: config!.password),
          decoration: const InputDecoration(labelText: "Password"),
          onChanged: (value) {
            setState(() {
              config = config!.copyWith(password: value);
            });
          },
        ),
        ElevatedButton(
          onPressed: () {
            // Save the changes
          },
          child: const Text("Save"),
        )
      ],
    );
  }
}
