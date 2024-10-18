import 'package:estadistica/widgetes/drawer.dart';
import 'package:estadistica/widgetes/scaffold.dart';
import 'package:flutter/material.dart';

class MediaScreen extends StatefulWidget {
  const MediaScreen({super.key});

  @override
  State<MediaScreen> createState() => _MediaScreenState();
}

class _MediaScreenState extends State<MediaScreen> {
  /// Lista para almacenar los controladores de los numeros ingresados por el usuario
  final List<TextEditingController> _controllers = [
    TextEditingController(),
  ];

  /// Metodo para liberar recursos de los controladores
  @override
  void dispose() {
    /// Liberar recursos de los controladores
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  /// Metodo para agregar un nuevo campo de texto
  void _addTextField() {
    setState(() {
      /// Aquí estamos agregando un nuevo controlador a la lista
      _controllers.add(TextEditingController());
    });
  }

  /// Metodo para eliminar un campo de texto
  void _deleteTextField(int index) {
    setState(() {
      _controllers.removeAt(index);
    });
  }

  /// Metodo para calcular la media
  void calcularMedia() {
    try {
      /// Convierto los valores de los controladores a numeros double
      // List<double> numeros = _controllers.map((numero) {
      //   return double.tryParse(numero.text) ?? 0.0;
      // }).toList();

      /// Aquí creo la lista de numeros vacía
      List<double> numeros = [];

      /// Recorro la lista de controladores donde se alojan los numeros ingresados por el usuario
      for (var controller in _controllers) {
        /// Verifico si el campo de texto está vacío
        if (controller.text.isEmpty) {
          /// Muestro un mensaje de error
          mensaje('Todos los Campos Deben Estar Llenos', context);
          return;
        }

        /// De no estar vacío convierto el valor a double y lo agrego a la lista de numeros
        numeros.add(double.parse(controller.text));
      }

      /// Sumo los valores de la lista de numeros
      /// La función reduce() recibe una función que se ejecuta por cada elemento de la lista
      /// y recibe dos parametros, el primero es el valor acumulado y el segundo es el valor actual
      dynamic suma = numeros.reduce((a, b) => a + b);

      /// Calculo la media
      /// La media es la suma de los valores dividido entre la cantidad de valores
      double media = suma / numeros.length;

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(
              'RESULTADO',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Text(
              'La media de los numeros: \n${numeros.join(', ')}\n\nEs: ${media.toStringAsFixed(4)}',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, 'media', (Route route) => false);
                },
                child: const Text(
                  'Calcular\nOtros Datos',
                  textAlign: TextAlign.center,
                ),
              ),
              ElevatedButton(
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
      print('Error al calcular la media: $e');
      mensaje('Error en Calcular La Media', context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calcular Media'),
        elevation: 20,
      ),
      drawer: drawerApp(context),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              for (var i = 0; i < _controllers.length; i++)
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: _controllers[i],
                    decoration: InputDecoration(
                      labelText: 'Número ${i + 1}',
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => _deleteTextField(i),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ElevatedButton(
                onPressed: () {
                  calcularMedia();
                },
                child: const Text('Calcular Media'),
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
