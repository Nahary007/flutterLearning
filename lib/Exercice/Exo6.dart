import 'package:flutter/material.dart';

class AnimedSquare extends StatefulWidget {
  const AnimedSquare({super.key});
  @override
  _AnimedSquareState createState() => _AnimedSquareState();
}

class _AnimedSquareState extends State<AnimedSquare>{
  bool _isAnimated = false;

  double _width = 100;
  double _height = 100;
  Color _color = Colors.red;
  BorderRadiusGeometry _borderRadius = BorderRadiusGeometry.circular(8);

  void _toggleAnimation() {
    setState(() {
      _isAnimated = !_isAnimated;
      _width = _isAnimated ? 200 : 100;
      _height = _isAnimated ? 200 : 100;
      _color = _isAnimated ? Colors.blue : Colors.red;
      _borderRadius = _isAnimated ? BorderRadiusGeometry.circular(30) : BorderRadiusGeometry.circular(8);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Carré Animé')),
      body: Center(
        child: AnimatedContainer(
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: _borderRadius,
          ),
          duration: Duration(seconds: 1),
          curve: Curves.easeInOut,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleAnimation,
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}