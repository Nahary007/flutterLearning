import 'package:flutter/material.dart';

//StatelessWidget
class Exo1 extends StatelessWidget{
  const Exo1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Compteur app')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          WelcomeMessage(),//widget Statique
          SizedBox(height : 20),
          CounterWidget()//widget dynamique
        ],
      ),
    );
  }
}

//widget statique
class WelcomeMessage extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return Text(
      'Bienvenue sur mon app',
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }
}

//widget dynamique
class CounterWidget extends StatefulWidget {
  @override
  _ConterWidgetState createState() => _ConterWidgetState();
}


class _ConterWidgetState extends State<CounterWidget> {
  int _Counter = 0;

  void incrementCounter() {
    setState(() {
      _Counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.countertops, size: 30,color: Colors.blue,),
            SizedBox(width: 10,),
            Text(
              'Compter : $_Counter',
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
        SizedBox(height: 10,),
        ElevatedButton(
            onPressed: incrementCounter,
            child: Text('Incrementer'),
        )
      ],
    );
  }
}