import 'package:flutter/material.dart';

import '../../widgetes/drawer.dart';

class TeamEswinPoroj extends StatelessWidget {
  const TeamEswinPoroj({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teams'),
        elevation: 20,
      ),
      drawer: drawerApp(context),
    );
  }
}
