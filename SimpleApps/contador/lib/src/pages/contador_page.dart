import 'dart:developer';

import 'package:flutter/material.dart';

class ContadorPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ContadorPageState();
}

class _ContadorPageState extends State<ContadorPage> {
  int _count = 0;

  final _textStyle = new TextStyle(
    fontSize: 20,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Hello World",
              style: _textStyle,
            ),
            Text(
              "data: $_count",
              style: _textStyle,
            )
          ],
        ),
      ),
      backgroundColor: Colors.blueGrey.shade200,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _creatbotones(),
    );
  }

  Widget _creatbotones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width: 0.5,
        ),
        FloatingActionButton(
          onPressed: _add_Counter,
          elevation: 5,
          tooltip: 'Increment Counter',
          child: const Icon(
            Icons.plus_one,
            size: 50,
          ),
        ),
        SizedBox(
          width: 0.5,
        ),
        FloatingActionButton(
          onPressed: _less_Counter,
          elevation: 5,
          tooltip: 'Increment Counter',
          child: const Icon(
            Icons.exposure_minus_1,
            size: 50,
          ),
        ),
        Expanded(child: SizedBox()),
        FloatingActionButton(
          onPressed: _reset_Counter,
          elevation: 5,
          tooltip: 'Increment Counter',
          child: const Icon(
            Icons.restore,
            size: 50,
          ),
        ),
      ],
    );
  }

  void _add_Counter() {
    setState(() => _count++);
  }

  void _less_Counter() {
    setState(() => _count--);
  }

  void _reset_Counter() {
    setState(() => _count = 0);
  }
}
