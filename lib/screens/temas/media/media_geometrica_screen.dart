import 'dart:math';

import 'package:flutter/material.dart';

import '../../../widgetes/drawer.dart';
import '../../../widgetes/scaffold.dart';

class MediaGeometricaScreen extends StatefulWidget {
  const MediaGeometricaScreen({super.key});

  @override
  State<MediaGeometricaScreen> createState() => _MediaGeometricaScreenState();
}

class _MediaGeometricaScreenState extends State<MediaGeometricaScreen> {
  List<TextEditingController> controller1 = [
    TextEditingController(),
  ];

  @override
  dispose() {
    for (var controller1 in controller1) {
      controller1.dispose();
    }
    super.dispose();
  }

  void _addTextField() {
    setState(() {
      controller1.add(TextEditingController());
    });
  }

  void _deleteTextField(int index) {
    setState(() {
      controller1.removeAt(index);
    });
  }

  void calcularMediaGeometrica() {
    try {
      List<double> numeros = [];
      for (var controller in controller1) {
        if (controller.text.isEmpty) {
          mensaje('Todos los Campos Deben Estar Llenos', context);
          return;
        }
        numeros.add(double.tryParse(controller.text) ?? 0.0);
      }

      if (numeros.contains(0.0)) {
        mensaje('No se permiten ceros', context);
        return;
      }

      double media = 1;
      for (var numero in numeros) {
        media *= numero;
      }

      double exponent = 1 / numeros.length;

      dynamic resultadoMediaGeometrica = pow(media, exponent);

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Resultado'),
            content: Text(
              'La media Geométrica de: \n${numeros.join(', ')} \n\nEs: ${resultadoMediaGeometrica.toStringAsFixed(4)}',
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    controller1 = [TextEditingController()];
                  });
                  for (var controller in controller1) {
                    controller.clear();
                  }
                },
                child: const Text('Calcular\nOtros Datos'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Aceptar'),
              )
            ],
          );
        },
      );
    } catch (e) {
      mensaje('Error en los datos ingresados', context);
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Media Geométrica'),
        elevation: 20,
      ),
      drawer: drawerApp(context),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              for (var i = 0; i < controller1.length; i++)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: controller1[i],
                    decoration: InputDecoration(
                      labelText: 'Número ${i + 1}',
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: () {
                          _deleteTextField(i);
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: () {
                  calcularMediaGeometrica();
                },
                child: const Text('Calcular Media Geométrica'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTextField,
        child: const Icon(Icons.add),
      ),
    );
  }
}
