import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertester/src/utils/texto.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _counter = 0;
  double _width = 400;
  double _height = 400;
  Color _color = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        elevation: 10,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Center(child: Text('Menu de opciones')),
          ),
          body: Container(
            color: Colors.blue,
            child: Text('Drawer'),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(mostrarText()),
      ),
      body: Center(
        child: AnimatedContainer(
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_counter),
            color: _color,
          ),
          duration: Duration(milliseconds: 1000),
          curve: Curves.bounceInOut,
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: _incrementarContador,
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: _reset,
            child: Icon(Icons.restore),
          ),
          FloatingActionButton(
            onPressed: _decrementarcontador,
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }

  void _incrementarContador() {
    setState(() {
      print(_counter);
      _counter = _counter + 100;
    });
  }

  void _decrementarcontador() {
    setState(() {
      _counter = _counter - 100;
    });
  }

  void _reset() {
    final random = Random();
    setState(() {
      _width = random.nextInt(400).toDouble();
      _height = random.nextInt(400).toDouble();
      _color = Color.fromRGBO(
          random.nextInt(255), random.nextInt(300), random.nextInt(300), 1);
      _counter = random.nextInt(100).toDouble();
      print(_width);
    });
  }
}
