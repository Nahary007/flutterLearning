import 'package:flutter/material.dart';

class Exo4 extends StatelessWidget {
  const Exo4({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cartes décorées')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DecoratedCard(
              title: 'Card 1',
              imageUrl:'https://via.placeholder.com/150',
              gradient: LinearGradient(colors: [Colors.purple, Colors.blue]),
              rotateImage: false,
            ),
            SizedBox(height: 20,),
            DecoratedCard(
              title: 'Card 2',
              imageUrl:'https://via.placeholder.com/150',
              gradient: LinearGradient(colors: [Colors.orange, Colors.red]),
              rotateImage: true,
            ),
            SizedBox(height: 20,),
            DecoratedCard(
              title: 'Card 3',
              imageUrl:'https://via.placeholder.com/150',
              gradient: LinearGradient(colors: [Colors.green, Colors.teal]),
              rotateImage: false,
            ),
          ],
        ),
      ),
    );
  }
}

class DecoratedCard extends StatelessWidget{
  final String title;
  final String imageUrl;
  final Gradient gradient;
  final bool rotateImage;

  const DecoratedCard({
    required this.title,
    required this.imageUrl,
    required this.gradient,
    required this.rotateImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(4, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Transform.rotate(
            angle: rotateImage ? 0.2:0.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                imageUrl, height: 100, width: 100, fit: BoxFit.cover,
              ),
            ),
          )
        ],
      )
    );
  }
}