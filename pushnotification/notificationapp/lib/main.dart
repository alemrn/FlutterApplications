import 'package:flutter/material.dart';
import 'package:notificationapp/src/pages/home_page.dart';
import 'package:notificationapp/src/pages/mensaje_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home': (_) => HomePage(),
        'mensaje': (_) => MensajePage(),
      },
    );
  }
}
