import 'package:flutter/material.dart';
import 'Facebook/OldLogin.dart';
import 'Exercice/Exo5.dart';

void main() => runApp(const MonApp());

class MonApp extends StatelessWidget {
  const MonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),// j’ai enlevé le bandeau rouge
      home: const CompteurPage(),
    );
  }
}
