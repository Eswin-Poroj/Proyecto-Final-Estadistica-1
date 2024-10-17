import 'package:flutter/material.dart';

import '../widgetes/drawer.dart';

class MedianaScreen extends StatefulWidget {
  const MedianaScreen({super.key});

  @override
  State<MedianaScreen> createState() => _MedianaScreenState();
}

class _MedianaScreenState extends State<MedianaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mediana'),
        elevation: 20,
      ),
      drawer: drawerApp(context),
    );
  }
}
