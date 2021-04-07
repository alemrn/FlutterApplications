import 'package:flutter/material.dart';
import 'package:headers/src/pages/slideshow_page.dart';
//import 'package:headers/src/pages/graficcas_circulares_page.dart';
// import 'package:headers/src/pages/animaciones_pages.dart';
// import 'package:headers/src/pages/headers_page.dart';

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
      home: SlideshowPage(),
    );
  }
}
