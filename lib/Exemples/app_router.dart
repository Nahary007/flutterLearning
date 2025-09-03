import 'package:flutter/material.dart';
import 'models/tache.dart';
import 'views/accueil.dart';
import 'views/detail_tache.dart';
import 'views/page_404.dart';

class AppRouter {
    static const String accueil = '/';
    static const String detailTache = '/detailTache';

    Route<dynamic> onGenerateRoute(RouteSettings settings) {
      switch (settings.name) {
        case accueil:
          return MaterialPageRoute(builder: (context) => Accueil());
        case detailTache:
          final tache = settings.arguments as Tache;
          return MaterialPageRoute(builder: (context) => DetailTache(tache: tache));

        default:
          return MaterialPageRoute(builder: (context) => Page404());
      }
    }
}