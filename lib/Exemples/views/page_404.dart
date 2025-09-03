import 'package:flutter/material.dart';

class Page404 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page non trouvée'),),
      body: Center(child: Text('Erreur 404 : Page non trouvée'),),
    );
  }
}