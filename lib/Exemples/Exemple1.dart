import 'package:flutter/material.dart';

class Exemple1 extends StatelessWidget {
  const Exemple1({super.key});

  @override
  Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
          title: const Text("Formulaire"),
    ),
    body: Column(
      children: [
        TextField(
          decoration: InputDecoration(labelText: 'Nom'),
        ),
        SizedBox(height: 20,),
        TextField(
          decoration: InputDecoration(labelText: 'Mot de passe'),
          obscureText: true,
        ),
        SizedBox(height: 20,),
        ElevatedButton(onPressed: () {
          print('Incription reussie');
    }, child: Text('S\'inscrire')),
    ],
    )
    );
  }
}