import 'package:flutter/material.dart';
import 'package:headers/src/pages/headers_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diseños',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HeadersPage(),
    );
  }
}
