import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContaierPage extends StatefulWidget {
  AnimatedContaierPage({Key key}) : super(key: key);

  @override
  _AnimatedContaierPageState createState() => _AnimatedContaierPageState();
}

class _AnimatedContaierPageState extends State<AnimatedContaierPage> {
  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.pink;
  BorderRadiusGeometry _borderadius = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          width: _width,
          height: _height,
          decoration: BoxDecoration(borderRadius: _borderadius, color: _color),
          duration: Duration(milliseconds: 1000),
          curve: Curves.bounceIn,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: _cambiarforma,
        backgroundColor: Colors.blue[800],
      ),
    );
  }

  void _cambiarforma() {
    final random = Random();

    setState(() {
      _width = random.nextInt(300).toDouble();
      _height = random.nextInt(300).toDouble();
      _color = Color.fromRGBO(
          random.nextInt(255), random.nextInt(300), random.nextInt(300), 1);
      _borderadius = BorderRadius.circular(random.nextInt(100).toDouble());
    });
  }
}
