import 'package:flutter/material.dart';

class CompteurPage extends StatefulWidget {
  const CompteurPage({super.key});

  @override
  _CompteurPageState createState() => _CompteurPageState();
}

class _CompteurPageState extends State<CompteurPage> {
  int _compteur = 0;

  void _incrementer() {
    setState(() {
      _compteur++;
    });
  }

  void _decrementer() {
    setState(() {
      _compteur--;
    });
  }

  void _remetteZero() {
    setState(() {
      _compteur = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Compteur interactif'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Valeur du compteur : ',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10,),
            Text(
              '$_compteur',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: _decrementer,
                    tooltip: 'Décrémenter',
                    iconSize: 30,
                    color: Colors.redAccent,
                ),
                SizedBox(width: 20,),
                TextButton(
                  onPressed: _remetteZero,
                  child: Text('Réinitialiser'),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.orange,
                    textStyle: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: _incrementer,
          child: Icon(Icons.add),
          tooltip: 'Incrémenter',
      ),
    );
  }
}