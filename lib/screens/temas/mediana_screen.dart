import 'package:estadistica/widgetes/scaffold.dart';
import 'package:flutter/material.dart';

import '../../widgetes/drawer.dart';

class MedianaScreen extends StatefulWidget {
  const MedianaScreen({super.key});

  @override
  State<MedianaScreen> createState() => _MedianaScreenState();
}

class _MedianaScreenState extends State<MedianaScreen> {
  List<TextEditingController> controller = [
    TextEditingController(),
  ];

  @override
  void dispose() {
    for (var controller in controller) {
      controller.dispose();
    }
    super.dispose();
  }

  void _addTextFieldController() {
    setState(() {
      controller.add(TextEditingController());
    });
  }

  void _deleteTextFieldController(int index) {
    setState(() {
      controller.removeAt(index);
    });
  }

  void calcularMediana() {
    try {
      List<double> numeros = [];

      for (var datos in controller) {
        if (datos.text.isEmpty) {
          mensaje('Por Favor Llene Todos Los Campos', context);
          return;
        }
        numeros.add(double.parse(datos.text));
      }

      if (controller.length < 2) {
        mensaje('Debe Ingresar Al Menos Dos Datos', context);
        return;
      }

      if (numeros.contains(0.0)) {
        mensaje('No se permiten ceros', context);
        return;
      }

      /// Ordana los numeros ingresados de forma acendente
      /// Metodo de Dart

      if (numeros.length % 2 == 0) {
        /// dividimos el tamaño de la lista entre 2
        /// y le quitamos cualquier decimal
        numeros.sort();
        int mitad = numeros.length ~/ 2;

        double mediana = (numeros[mitad - 1] + numeros[mitad]) / 2;

        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Resultado'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'La Mediana de los Numeros:',
                  ),
                  Text(
                    numeros.join(', '),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'La Mediana es:',
                  ),
                  Text(
                    mediana.toStringAsFixed(2),
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
                      controller.clear();
                      controller.add(TextEditingController());
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
      } else {
        /// dividimos el tamaño de la lista entre 2
        /// y le quitamos cualquier decimal
        numeros.sort();
        int mitad = (numeros.length) ~/ 2;

        print('la mitad es $mitad');

        double mediana = numeros[mitad];

        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Resultado'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'La Mediana de los Numeros:',
                  ),
                  Text(
                    numeros.join(', '),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'La Mediana es:',
                  ),
                  Text(
                    mediana.toStringAsFixed(2),
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
                      controller.clear();
                      controller.add(TextEditingController());
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
      }
    } catch (e) {
      print(e);
      mensaje('Error En Calcular La Mediana', context);
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mediana'),
        elevation: 20,
      ),
      drawer: drawerApp(context),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              for (var i = 0; i < controller.length; i++)
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: controller[i],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Numero ${i + 1}',
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: () {
                          _deleteTextFieldController(i);
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ),
                  ),
                ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  calcularMediana();
                },
                child: const Text('Calcular Mediana'),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTextFieldController,
        child: const Icon(Icons.add),
      ),
    );
  }
}
