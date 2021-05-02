import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zapatos/src/models/zapato_model.dart';
import 'package:zapatos/src/pages/zapato_desc_page.dart';
import 'package:zapatos/src/pages/zapato_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new ZapatoModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shoes APP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ZapatoPage(),
    );
  }
}
