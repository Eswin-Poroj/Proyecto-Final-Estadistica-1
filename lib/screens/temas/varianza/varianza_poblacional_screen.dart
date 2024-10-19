import 'dart:math';
import 'package:estadistica/widgetes/scaffold.dart';
import 'package:flutter/material.dart';
import '../../../widgetes/drawer.dart';

class VarianzaPoblacionalScreen extends StatefulWidget {
  const VarianzaPoblacionalScreen({super.key});

  @override
  State<VarianzaPoblacionalScreen> createState() =>
      _VarianzaPoblacionalScreenState();
}

class _VarianzaPoblacionalScreenState extends State<VarianzaPoblacionalScreen> {
  List<TextEditingController> controllers = [
    TextEditingController(),
  ];

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _addTextEditingController() {
    setState(() {
      controllers.add(TextEditingController());
    });
  }

  void _deleteTextEditingController(int index) {
    setState(() {
      controllers.removeAt(index);
    });
  }

  void calcularDesviacionEstandar() {
    try {
      List<double> datos = [];

      for (var controller in controllers) {
        if (controller.text.isEmpty) {
          mensaje('Todos Los Campos Deben Estar Llenos', context);
          return;
        } else {
          datos.add(double.parse(controller.text));
        }
      }

      if (controllers.length < 2) {
        mensaje('Debe Ingresar Al Menos Dos Datos', context);
        return;
      }

      /// Calculo de la Media
      double media = datos.reduce((a, b) => a + b) / datos.length;

      /// Calculo de la Varianza
      double varianza = datos
              .map((e) => pow((e - media), 2).toDouble())
              .reduce((a, b) => a + b) /
          (datos.length);

      /// Calculo de la Desviación Estandar
      double desviacionEstandar = sqrt(varianza);

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Resultado'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'La Varianza es:',
                ),
                Text(
                  varianza.toStringAsFixed(4),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'La Desviación Estandar Poblacional es:',
                ),
                Text(
                  desviacionEstandar.toStringAsFixed(4),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  setState(() {
                    controllers.clear();
                    controllers.add(TextEditingController());
                  });
                  Navigator.of(context).pop();
                },
                child: const Text('Calcular Otros Datos'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Aceptar'),
              ),
            ],
          );
        },
      );
    } catch (e) {
      mensaje('Error en Calcular La Varianza y Desviación Estandar', context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Desviación Estándar Poblacional'),
        elevation: 20,
      ),
      drawer: drawerApp(context),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              for (var i = 0; i < controllers.length; i++)
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextField(
                    controller: controllers[i],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Número ${i + 1}',
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          _deleteTextEditingController(i);
                        },
                      ),
                    ),
                  ),
                ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  calcularDesviacionEstandar();
                },
                child: const Text('Calcular Varianza y Desviación Estandar'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addTextEditingController();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
