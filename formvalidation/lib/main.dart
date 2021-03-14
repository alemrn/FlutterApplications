import 'package:flutter/material.dart';
import 'package:formvalidation/preferences/preferencias_usuario.dart';
import 'package:formvalidation/src/pages/home_page.dart';
import 'package:formvalidation/src/pages/login_page.dart';
import 'package:formvalidation/src/pages/product_page.dart';
import 'package:formvalidation/src/pages/registro_page.dart';

import 'src/blocs/provider.dart';

void main() async {
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prefs = new PreferenciasUsuario();

    print(prefs.token);

    return Provider(
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        initialRoute: 'login',
        routes: {
          'login': (_) => LoginPage(),
          'home': (_) => HomePage(),
          'product': (_) => ProductPage(),
          'registro': (_) => RegistroPage()
        },
        theme: ThemeData(
          primaryColor: Colors.deepPurple,
        ),
      ),
    );
  }
}
