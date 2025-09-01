import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text('Page avec BottomNavigationBar'),),
        body: Center(child: Text('Contenu principal'),),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
            BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Bussiness'),
            BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Ecole')
          ],
        ),
      );
  }
}