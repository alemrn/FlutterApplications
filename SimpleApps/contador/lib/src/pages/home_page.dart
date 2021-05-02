import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  int _count = 0;

  final textStyle = new TextStyle(
    fontSize: 20,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample app with flutter'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Hello World",
            style: textStyle,
          ),
          Text(
            "data: $_count",
            style: textStyle,
          )
        ],
      )),
      backgroundColor: Colors.blueGrey.shade200,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: changecount(),
        elevation: 5,
        tooltip: 'Increment Counter',
        child: const Icon(
          Icons.add_a_photo,
          size: 50,
        ),
      ),
    );
  }

  changecount() {
    _count++;
    log("Changng the count");
  }
}
