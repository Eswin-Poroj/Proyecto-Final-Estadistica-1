import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widgetes/drawer.dart';

class TeamMartinLeiva extends StatelessWidget {
  const TeamMartinLeiva({super.key});

  void _goToGitHub() async {
    const String url = 'https://github.com/Eswin-Poroj';
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
        title: const Text('Teams'),
        elevation: 20,
      ),
      drawer: drawerApp(context),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          child: Column(
            children: [
              const Text(
                'Martin Leiva',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              CircleAvatar(
                radius: 100,
                backgroundImage: const AssetImage(
                  'assets/team/fotoMartin.jpg',
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Text(
                    'Nombre:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text('Martin Antonio Leiva Gómez'),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text(
                    'Carnet:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text('1490 - 23 - 23158'),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Le interesa todo lo que tenga que ver con tecnología, su experiencia en el campo de la electronica y la electricidad, despertaron su interés en las ciencias informáticas para poder complementar y mejorar sus habilidades. Desea conocer cómo poder comunicarse e interactuar con dispositivos inteligentes para poder aprovechar al máximo esos recursos. Su interés primordial es la aplicación de los dispositivos inteligentes en el campo de la medicina, especialmente en el area de imágenes de diagnostico e instrumentación para procedimientos quirúrgicos. Siempre tiene presente que todos los días se aprende algo nuevo y que nunca es tarde para empezar en un campo tan apasionante como lo es Ingeniería en Ciencias de la Computación e Informatica.',
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _goToGitHub();
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/logos/github.png', width: 30),
                    const SizedBox(width: 25),
                    const Text('IR A GITHUB'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
