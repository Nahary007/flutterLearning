import 'package:flutter/material.dart';
import 'package:projet1/Exercice/Exo2.dart';
import 'Exemples/Exemple.dart';

void main() => runApp(const MonApp());

class MonApp extends StatelessWidget {
  const MonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Exo2(), // bien avec const
    );
  }
}
