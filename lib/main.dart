import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Exercice/tache_bloc.dart';
import 'Exercice/tache_page.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => TacheBloc(),
      child: const MonApp(),
    )
  );
}

class MonApp extends StatelessWidget {
  const MonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TachePage(),
    );
  }
}