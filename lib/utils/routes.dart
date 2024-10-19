import 'package:estadistica/screens/temas/cuartiles_screen.dart';
import 'package:estadistica/screens/home_screen.dart';
import 'package:estadistica/screens/temas/media/media_armonizada_screen.dart';
import 'package:estadistica/screens/temas/mediana_screen.dart';
import 'package:estadistica/screens/temas/moda_screen.dart';
import 'package:estadistica/screens/teams/team_eswin_poroj.dart';
import '../screens/temas/media/media_geometrica_screen.dart';
import '../screens/temas/media/media_ponderada_screen.dart';
import '../screens/temas/media/media_screen.dart';
import '../screens/temas/varianza/varianza_muestral_screen.dart';
import '../screens/temas/varianza/varianza_poblacional_screen.dart';

final routes = {
  '/': (context) => const HomeScreen(),

  /// Rutas de la Media
  'media': (context) => const MediaScreen(),
  'mediaGeometrica': (context) => const MediaGeometricaScreen(),
  'mediaPonderada': (context) => const MediaPonderadaScreen(),
  'mediaArmonizada': (context) => const MediaArmonizadaScreen(),

  /// Rutas de la Varianza
  'varianza': (context) => const VarianzaPoblacionalScreen(),
  'varianzaMuestral': (context) => const VarianzaMuestralScreen(),

  /// Rutas de la Mediana
  'mediana': (context) => const MedianaScreen(),

  /// Rutas de la Moda
  'moda': (context) => const ModaScreen(),

  /// Rutas de los Cuartiles
  'cuartiles': (context) => const CuartilesScreen(),

  /// Rutas del Teams
  'teamsEswinPoroj': (context) => const TeamEswinPoroj(),
};
