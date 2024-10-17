import 'package:flutter/material.dart';

void mensaje(String mensaje, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(mensaje),
      duration: const Duration(seconds: 2),
    ),
  );
}
