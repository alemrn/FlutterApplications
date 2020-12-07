import 'package:flutter/material.dart';
import 'package:qrapplication/pages/home_page.dart';
import 'package:qrapplication/pages/map_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR App',
      initialRoute: 'home',
      routes: {
        'home': (_) => HomePage(),
        'mapa': (_) => MapaPage(),
      },
    );
  }
}
