import 'package:flutter/material.dart';
import 'package:projet1/Exemples/app_router.dart';
import '../models/tache.dart';

class Accueil extends StatelessWidget {
  final List<Tache> _taches = [
    Tache(titre: 'Tache 1', description: 'Description 1'),
    Tache(titre: 'Tache 2', description: 'Description 2')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Accueil'),),
      body: ListView.builder(
        itemCount: _taches.length,
        itemBuilder: (context, index) {
          final tache = _taches[index];
          return ListTile(
            title: Text(tache.titre),
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRouter.detailTache,
                arguments: tache,
              );
            },
          );
        },
      ),
    );
  }
}