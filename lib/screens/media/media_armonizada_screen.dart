import 'package:estadistica/widgetes/drawer.dart';
import 'package:estadistica/widgetes/scaffold.dart';
import 'package:flutter/material.dart';

class MediaArmonizadaScreen extends StatefulWidget {
  const MediaArmonizadaScreen({super.key});

  @override
  State<MediaArmonizadaScreen> createState() => _MediaArmonizadaScreenState();
}

class _MediaArmonizadaScreenState extends State<MediaArmonizadaScreen> {
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

  void _addTextEditindController() {
    setState(() {
      controllers.add(TextEditingController());
    });
  }

  void _deleteTextEditingController(int index) {
    setState(() {
      controllers.removeAt(index);
    });
  }

  void calcularMediaArmonizada() {
    try {
      List<double> datos = [];

      for (var dato in controllers) {
        if (dato.text.isEmpty) {
          mensaje('Todos los Campos Deben Estar Llenos', context);
          return;
        } else {
          datos.add(double.parse(dato.text));
        }
      }

      double suma = 0;
      for (var numero in datos) {
        suma += 1 / numero;
      }

      double mediaArmonizada = datos.length / suma;

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Resultado'),
            content: Text(
              'La Media Armonizada de: \n${datos.join(', ')} \n\nEs: ${mediaArmonizada.toStringAsFixed(4)}',
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  setState(() {
                    controllers.clear();
                    controllers.add(TextEditingController());
                  });
                },
                child: const Text('Calcular\nOtros Datos'),
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
      mensaje('Error En Calcular La Media Armonizada', context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Media Armonizada'),
      ),
      drawer: drawerApp(context),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
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
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: () {
                          _deleteTextEditingController(i);
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ),
                  ),
                ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  calcularMediaArmonizada();
                },
                child: const Text('Calcular Media Armonizada'),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addTextEditindController();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
