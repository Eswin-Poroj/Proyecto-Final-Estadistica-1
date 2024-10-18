import 'package:flutter/material.dart';

Widget drawerApp(BuildContext context) {
  return Drawer(
    elevation: 20,
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Column(
            children: [
              Image(
                image: AssetImage('assets/logos/logoApp.png'),
                width: 70,
                alignment: Alignment.centerRight,
              ),
              SizedBox(height: 10),
              Text(
                'BIENVENIDOS A LA CALCULADORA DE ESTADÍSTICA',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.home,
            color: Colors.black,
          ),
          title: const Text('Inicio'),
          onTap: () {
            Navigator.pushNamedAndRemoveUntil(
                context, '/', (Route route) => false);
          },
        ),
        ExpansionTile(
          leading: const Icon(
            Icons.calculate,
            color: Colors.black,
          ),
          title: const Text('Media'),
          children: <Widget>[
            ListTile(
              leading: const Text(
                'X̄',
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              title: const Text('Media Aritmética'),
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, 'media', (Route route) => false);
              },
            ),
            ListTile(
              leading: const Text(
                'M',
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              title: const Text('Media Ponderada'),
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, 'mediaPonderada', (Route route) => false);
              },
            ),
            ListTile(
              leading: const Text(
                '^M',
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              title: const Text('Media Geométrica'),
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, 'mediaGeometrica', (Route route) => false);
              },
            ),
            ListTile(
              leading: const Text(
                'A',
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              title: const Text('Media Armonizada'),
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, 'mediaArmonizada', (Route route) => false);
              },
            )
          ],
        ),
        ExpansionTile(
          leading: Image.asset(
            'assets/logos/varianza.png',
            width: 20,
            alignment: Alignment.centerLeft,
          ),
          title: const Text('Varianza'),
          children: <Widget>[
            ListTile(
              leading: Image.asset(
                'assets/logos/varianza.png',
                width: 15,
              ),
              title: const Text('Varianza y Desviación Estándar (Poblacional)'),
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, 'varianza', (Route route) => false);
              },
            ),
            ListTile(
              leading: Image.asset(
                'assets/logos/desviacionEstandar.png',
                width: 15,
              ),
              title: const Text('Varianza y Desviación Estándar (Muestral)'),
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, 'varianzaMuestral', (Route route) => false);
              },
            ),
          ],
        ),
        ListTile(
          leading: const Text(
            'M',
            textAlign: TextAlign.end,
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          title: const Text('Mediana'),
          onTap: () {
            Navigator.pushNamedAndRemoveUntil(
                context, 'mediana', (Route route) => false);
          },
        ),
        ListTile(
          leading: const Text(
            '^M',
            textAlign: TextAlign.end,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          title: const Text('Moda'),
          onTap: () {
            Navigator.pushNamedAndRemoveUntil(
                context, 'moda', (Route route) => false);
          },
        ),
        ListTile(
          leading: const Text(
            'C',
            textAlign: TextAlign.end,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          title: const Text('Cuartiles'),
          onTap: () {
            Navigator.pushNamedAndRemoveUntil(
                context, 'cuartiles', (Route route) => false);
          },
        ),
        const SizedBox(height: 50),
        const Divider(),
        const SizedBox(height: 50),
        ExpansionTile(
          leading: const Icon(
            Icons.group,
            color: Colors.black,
          ),
          title: const Text('Team'),
          children: [
            ListTile(
              title: const Text('Eswin Poroj'),
              leading: const Icon(
                Icons.person,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  'teamsEswinPoroj',
                  (Route route) => false,
                );
              },
            )
          ],
        )
      ],
    ),
  );
}
