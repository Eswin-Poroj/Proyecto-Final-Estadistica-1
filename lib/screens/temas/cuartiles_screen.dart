import 'package:estadistica/widgetes/scaffold.dart';
import 'package:flutter/material.dart';

import '../../widgetes/drawer.dart';

class CuartilesScreen extends StatefulWidget {
  const CuartilesScreen({super.key});

  @override
  State<CuartilesScreen> createState() => _CuartilesScreenState();
}

class _CuartilesScreenState extends State<CuartilesScreen> {
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

  void _addTextField() {
    setState(() {
      controllers.add(TextEditingController());
    });
  }

  void _removeTextField() {
    setState(() {
      if (controllers.length > 1) {
        controllers.removeLast();
      }
    });
  }

  void calcularCuartiles() {
    try {
      List<double> datos = [];

      for (var dato in controllers) {
        if (dato.text.isEmpty) {
          mensaje('Todos Los Campos Deben Estar Llenos', context);
          return;
        }
        datos.add(double.parse(dato.text));
      }

      datos.sort();

      int n = datos.length;

      double q1 = (n + 1) / 4;
      double q2 = (n + 1) / 2;
      double q3 = (3 * (n + 1)) / 4;

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Resultado'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('De los Numeros Ingresados:'),
                Text(
                  datos.join(', ').toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text('El Cuartil 1 es:'),
                Text(
                  q1.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('El Cuartil 2 es:'),
                Text(
                  q2.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('El Cuartil 3 es:'),
                Text(
                  q3.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
                child: const Text('Calcular Nuevos Datos'),
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
      print('error: $e');
      mensaje('Error No Se Pudo Calcular Los Cuartiles', context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cuartiles'),
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
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: controllers[i],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Numero ${i + 1}',
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          _removeTextField();
                        },
                      ),
                    ),
                  ),
                ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  calcularCuartiles();
                },
                child: const Text('Calcular Cuartiles'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addTextField();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
