import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Exemples/Todo.dart'; // fichier où tu as défini TodoPage et ListeTodo

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ListeTodo(),
      child: const MonApp(),
    ),
  );
}

class MonApp extends StatelessWidget {
  const MonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TodoPage(), // 🚀 On démarre directement sur la TodoPage
    );
  }
}
