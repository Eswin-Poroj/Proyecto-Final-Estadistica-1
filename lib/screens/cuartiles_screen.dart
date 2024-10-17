import 'package:flutter/material.dart';

import '../widgetes/drawer.dart';

class CuartilesScreen extends StatefulWidget {
  const CuartilesScreen({super.key});

  @override
  State<CuartilesScreen> createState() => _CuartilesScreenState();
}

class _CuartilesScreenState extends State<CuartilesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cuartiles'),
        elevation: 20,
      ),
      drawer: drawerApp(context),
    );
  }
}
