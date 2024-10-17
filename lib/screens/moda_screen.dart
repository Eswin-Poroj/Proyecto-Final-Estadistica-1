import 'package:flutter/material.dart';

import '../widgetes/drawer.dart';

class ModaScreen extends StatefulWidget {
  const ModaScreen({super.key});

  @override
  State<ModaScreen> createState() => _ModaScreenState();
}

class _ModaScreenState extends State<ModaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Moda'),
        elevation: 20,
      ),
      drawer: drawerApp(context),
    );
  }
}
