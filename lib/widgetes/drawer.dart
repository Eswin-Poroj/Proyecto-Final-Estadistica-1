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
          title: const Text('Estadística'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Image.asset(
            'assets/logos/media.png',
            width: 30,
          ),
          title: const Text('Media'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ExpansionTile(
          leading: Image.asset(
            'assets/logos/varianza.png',
            width: 30,
            alignment: Alignment.centerLeft,
          ),
          title: const Text('Varianza'),
          children: <Widget>[
            ListTile(
              leading: Image.asset(
                'assets/logos/varianza.png',
                width: 30,
              ),
              title: const Text('Varianza'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Image.asset(
                'assets/logos/desviacionEstandar.png',
                width: 25,
              ),
              title: const Text('Desviación Estándar'),
              onTap: () {
                Navigator.pop(context);
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
            Navigator.pop(context);
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
            Navigator.pop(context);
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
            Navigator.pop(context);
          },
        )
      ],
    ),
  );
}
