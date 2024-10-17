import 'package:flutter/material.dart';

import '../../widgetes/drawer.dart';

class VarianzaPoblacionalScreen extends StatefulWidget {
  const VarianzaPoblacionalScreen({super.key});

  @override
  State<VarianzaPoblacionalScreen> createState() =>
      _VarianzaPoblacionalScreenState();
}

class _VarianzaPoblacionalScreenState extends State<VarianzaPoblacionalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Varianza'),
        elevation: 20,
      ),
      drawer: drawerApp(context),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const Text(
                'Varianza Poblacional',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'La varianza es una medida de dispersión que se utiliza para saber cuánto se alejan los datos de la media. Es decir, nos indica la variabilidad de los datos respecto a la media. Cuanto mayor sea la varianza, mayor será la dispersión de los datos; y cuanto menor sea la varianza, menor será la dispersión de los datos.',
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 20),
              const Text(
                'La fórmula para calcular la varianza es:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Varianza = Σ (xi - x̄)² / n',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Donde:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Σ = Sumatoria',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'xi = Valor de cada dato',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'x̄ = Media aritmética',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'n = Número total de datos',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Para calcular la varianza, primero se calcula la media aritmética de los datos. Luego, se resta cada dato de la media y se eleva al cuadrado. Finalmente, se suman todos los resultados y se dividen entre el número total de datos.',
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
