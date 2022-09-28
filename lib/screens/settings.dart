import 'package:flutter/material.dart';
import 'package:kwik/utils/firestorage.dart';

class Appsettings extends StatefulWidget {
  const Appsettings({super.key});

  @override
  State<Appsettings> createState() => _AppsettingsState();
}

class _AppsettingsState extends State<Appsettings> {
  Store store = Store();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              store.changeavatar();
            },
            child: const Text('Change avatar')),
      ),
    );
  }
}
