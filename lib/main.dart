import 'package:flutter/material.dart';
import 'Exercice/Exo3.dart';

void main() => runApp(const MonApp());

class MonApp extends StatelessWidget {
  const MonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // j’ai enlevé le bandeau rouge
      home: const Exo3(),
    );
  }
}
