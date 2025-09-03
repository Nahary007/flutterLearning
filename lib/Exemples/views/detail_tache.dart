import 'package:projet1/Exemples/app_router.dart';
import '../models/tache.dart';
import 'package:flutter/material.dart';

class DetailTache extends StatelessWidget {
  final Tache tache;

  DetailTache({required this.tache});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail de la tache'),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(tache.titre, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),), SizedBox(height: 10,), Text(tache.description)
          ],
        ),
      ),
    );
  }
}