import 'package:flutter/material.dart';

import '../../widgetes/drawer.dart';

class MediaGeometricaScreen extends StatefulWidget {
  const MediaGeometricaScreen({super.key});

  @override
  State<MediaGeometricaScreen> createState() => _MediaGeometricaScreenState();
}

class _MediaGeometricaScreenState extends State<MediaGeometricaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Media Geométrica'),
        elevation: 20,
      ),
      drawer: drawerApp(context),
    );
  }
}
