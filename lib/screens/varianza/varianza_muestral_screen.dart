import 'package:flutter/material.dart';

import '../../widgetes/drawer.dart';

class VarianzaMuestralScreen extends StatefulWidget {
  const VarianzaMuestralScreen({super.key});

  @override
  State<VarianzaMuestralScreen> createState() => _VarianzaMuestralScreenState();
}

class _VarianzaMuestralScreenState extends State<VarianzaMuestralScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Varianza Muestral'),
        elevation: 20,
      ),
      drawer: drawerApp(context),
    );
  }
}
