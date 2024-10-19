import 'package:estadistica/widgetes/drawer.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _goToGitHub() async {
    const String url =
        'https://github.com/Eswin-Poroj/Proyecto-Final-Estadistica-1';
    try {
      if (!await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(
          Uri.parse(
            url,
          ),
          mode: LaunchMode.externalApplication,
        );
      }
    } catch (e) {
      print('error: $e');
      throw Exception('No se pudo abrir el enlace');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de Estadística'),
        elevation: 20,
      ),
      drawer: drawerApp(context),
      backgroundColor: const Color.fromARGB(255, 227, 238, 222),
      body: SingleChildScrollView(
        child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                const Text(
                  'Bienvenido a la Calculadora de Estadística',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const Image(
                  width: 150,
                  image: AssetImage(
                    'assets/logos/logoApp.png',
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Esta aplicación fue creada para facilitar el cálculo de estadísticas básicas, como la media, la mediana, la moda y la varianza.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  ' PARA COMENZAR, SELECCIONA UNA OPCIÓN DEL MENÚ LATERAL. ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      backgroundColor: Colors.black12),
                ),
                const SizedBox(height: 30),
                const Text(
                  'Desarrolladores:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        const Text(
                          'Eswin Poroj',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: const AssetImage(
                            'assets/team/fotoEswin.jpg',
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        const Text(
                          'Martin Leiva',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: const AssetImage(
                            'assets/team/fotoMartin.jpg',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    _goToGitHub();
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 20,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 10,
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        width: 30,
                        image: AssetImage(
                          'assets/logos/github.png',
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(
                        'Visitar Repositorio',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
