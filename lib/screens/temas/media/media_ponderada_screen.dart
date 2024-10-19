import 'package:flutter/material.dart';
import '../../../widgetes/drawer.dart';
import '../../../widgetes/scaffold.dart';

class MediaPonderadaScreen extends StatefulWidget {
  const MediaPonderadaScreen({super.key});

  @override
  State<MediaPonderadaScreen> createState() => _MediaPonderadaScreenState();
}

class _MediaPonderadaScreenState extends State<MediaPonderadaScreen> {
  /// Lista para almacenar los controladores de los numeros ingresados por el usuario
  List<TextEditingController> controller1 = [
    TextEditingController(),
  ];
  List<TextEditingController> controller2 = [
    TextEditingController(),
  ];

  /// Metodo para liberar recursos de los controladores
  @override
  void dispose() {
    /// Liberar recursos de los controladores de la lista controller 1
    for (var controller1 in controller1) {
      controller1.dispose();
    }

    /// Liberar recursos de los controladores de la lista controller 2
    for (var controller2 in controller2) {
      controller2.dispose();
    }

    super.dispose();
  }

  /// Metodo para agregar un nuevo campo de texto
  void _addTextField() {
    setState(() {
      /// Aquí estamos agregando un nuevo controlador a la lista controller 1
      controller1.add(TextEditingController());

      /// Aquí estamos agregando un nuevo controlador a la lista controller 2
      controller2.add(TextEditingController());
    });
  }

  /// Metodo para eliminar un campo de texto
  void _deleteTextField(int index) {
    setState(() {
      /// Eliminamos el controlador de la lista controller 1
      controller1.removeAt(index);

      //// Eliminamos el controlador de la lista controller 2
      controller2.removeAt(index);
    });
  }

  void calcularMedia() {
    try {
      /// Convierto los valores de los controladores a numeros double
      List<double> numeros = controller1.map((numero) {
        return double.tryParse(numero.text) ?? 0.0;
      }).toList();

      List<double> pesos = controller2.map((numero) {
        return double.tryParse(numero.text) ?? 0.0;
      }).toList();

      /// Aquí creo la lista de numeros vacía
      List<double> resultados = [];

      /// Recorro la lista de controladores donde se alojan los numeros ingresados por el usuario
      /// para verificar si los campos de texto están vacíos
      for (var controller in controller1) {
        if (controller.text.isEmpty) {
          mensaje('Todos los Campos Deben Estar Llenos', context);
          return;
        }
      }

      /// Recorrolo la lista controller 2 verificando qué no haya campos vacíos
      for (var controller in controller2) {
        if (controller.text.isEmpty) {
          mensaje('Todos los Campos Deben Estar Llenos', context);
          return;
        }
      }

      if (numeros.contains(0.0)) {
        mensaje('No se permiten ceros', context);
        return;
      }

      if (numeros.length < 2 || pesos.length < 2) {
        mensaje('Debes Ingresar Al Menos 2 Datos', context);
        return;
      }

      /// Recorro la lista de controladores donde se alojan los numeros ingresados por el usuario
      for (var i = 0; i < controller1.length; i++) {
        /// Agrego el resultado de la multiplicación de los numeros ingresados por el usuario
        resultados.add(numeros[i] * pesos[i]);
      }

      /// Aquí sumo todos los resultados de la multiplicación
      double sumaResultados =
          resultados.reduce((value, element) => value + element);

      /// Aquí sumo todos los pesos
      double sumaPesos = pesos.reduce((value, element) => value + element);

      /// Aquí divido la suma de los resultados entre la suma de los pesos
      double mediaPonderada = sumaResultados / sumaPesos;

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Media Ponderada'),
            content: Text(
              'La Media Ponderada de los numeros:\n\nValor:\n${numeros.join(', ')}\n\nPesos:\n${pesos.join(', ')}\n\nEs de: ${mediaPonderada.toStringAsFixed(4)}',
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    'mediaPonderada',
                    (Route route) => false,
                  );
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

      /// Muestro el resultado de la media ponderada
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Media Ponderada',
        ),
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
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextField(
                          controller: controller1[i],
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Valor',
                            hintText: 'Ingrese un valor',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller: controller2[i],
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Peso',
                            hintText: 'Ingrese un peso',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          _deleteTextField(i);
                        },
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  calcularMedia();
                },
                child: const Text('Calcular Media Ponderada'),
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
