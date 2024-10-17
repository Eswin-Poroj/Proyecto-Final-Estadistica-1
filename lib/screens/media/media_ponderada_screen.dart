import 'package:flutter/material.dart';

import '../../widgetes/drawer.dart';

class MediaPonderadaScreen extends StatefulWidget {
  const MediaPonderadaScreen({super.key});

  @override
  State<MediaPonderadaScreen> createState() => _MediaPonderadaScreenState();
}

class _MediaPonderadaScreenState extends State<MediaPonderadaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Media Ponderada'),
        elevation: 20,
      ),
      drawer: drawerApp(context),
    );
  }
}
