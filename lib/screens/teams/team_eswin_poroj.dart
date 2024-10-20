import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widgetes/drawer.dart';

class TeamEswinPoroj extends StatelessWidget {
  const TeamEswinPoroj({super.key});

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
                'Eswin Poroj',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              CircleAvatar(
                radius: 100,
                backgroundImage: const AssetImage(
                  'assets/team/fotoEswin.jpg',
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
                  const Text('Eswin Stuard Poroj Castro'),
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
                  const Text('1490 - 23 - 22603'),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Estudiante de la Universidad de Mariano Gálvez De Guatemala, Facultad de Ingeniería en Sistemas, actualmente cursando el 2do año de la carrera. Me considero una persona responsable, proactiva, con deseos de superación y aprendizaje constante. Me gusta trabajar en equipo y aportar ideas que ayuden a mejorar el trabajo en conjunto. Me gusta la programación y el desarrollo de software, siempre busco mejorar mis habilidades y conocimientos en el área de la tecnología.',
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 10),
              const Text(
                'Soy un apasionado estudiante de Ingeniería en Sistemas, enamorado de la tecnología y todo lo que se puede lograr con ella. Me encanta crear soluciones innovadoras a través del desarrollo de sistemas. Mi objetivo es mejorar constantemente mis habilidades y contribuir al mundo de la tecnología con ideas que hagan la vida más fácil y eficiente.',
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
