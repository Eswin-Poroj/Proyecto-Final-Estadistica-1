import 'package:flutter/material.dart';

import '../../widgetes/drawer.dart';
import '../../widgetes/scaffold.dart';

class ModaScreen extends StatefulWidget {
  const ModaScreen({super.key});

  @override
  State<ModaScreen> createState() => _ModaScreenState();
}

class _ModaScreenState extends State<ModaScreen> {
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

  void _addTextFieldController() {
    setState(() {
      controllers.add(TextEditingController());
    });
  }

  void _deleteTextFieldController(int index) {
    setState(() {
      controllers.removeAt(index);
    });
  }

  void calcularModa() {
    try {
      List<double> numeros = [];

      for (var dato in controllers) {
        if (dato.text.isEmpty) {
          mensaje('Todos Los Campos Deben Estar Llenos', context);
          return;
        }
        numeros.add(double.parse(dato.text));
      }

      if (controllers.length < 2) {
        mensaje('Debe Ingresar Al Menos 2 Datos', context);
        return;
      }

      numeros.sort();

      int contador = 0;

      int modaMaxima = 0;

      List<double> moda = [];

      for (var i = 0; i < numeros.length; i++) {
        contador = 0;
        for (var j = 0; j < numeros.length; j++) {
          if (numeros[i] == numeros[j]) {
            contador++;
          }
        }

        if (contador > modaMaxima) {
          modaMaxima = contador;
          moda.clear();
          moda.add(numeros[i]);
        } else if (contador == modaMaxima) {
          moda.add(numeros[i]);
        }
      }

      if (numeros.length == moda.length) {
        mensaje(
            'No Existe Moda o Ingreso Un Mismo Numero Varias Veces', context);
        return;
      }

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Resultado'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('La Moda de los Numeros:'),
                Text(
                  numeros.join(', '),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text('La Moda es:'),
                Text(
                  moda[0].toString(),
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
                child: const Text('Calcular Otros Datos'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Aceptar'),
              ),
            ],
          );
        },
      );
    } catch (e) {
      print(e);
      mensaje('Error En Calcular La Moda', context);
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Moda'),
        elevation: 20,
      ),
      drawer: drawerApp(context),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              for (var i = 0; i < controllers.length; i++)
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: controllers[i],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Numero ${i + 1}',
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: () {
                          _deleteTextFieldController(i);
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ),
                  ),
                ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  calcularModa();
                },
                child: const Text('Calcular Moda'),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addTextFieldController();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
