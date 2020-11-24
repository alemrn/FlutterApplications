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
        child: Container(
          width: _width,
          height: _height,
          decoration: BoxDecoration(borderRadius: _borderadius, color: _color),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            double _width = 20.0;
            double _height = 100.0;
            Color _color = Colors.white60;
            BorderRadiusGeometry _borderadius = BorderRadius.circular(10.0);
          });
        },
        backgroundColor: Colors.blue[800],
      ),
    );
  }
}
