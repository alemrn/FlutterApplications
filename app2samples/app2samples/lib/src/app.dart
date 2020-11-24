import 'package:app2samples/src/Pages/alert_page.dart';
import 'package:app2samples/src/routes/routes.dart';

import 'package:flutter/material.dart';

import 'Pages/card_page.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'ComponentesApp',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        //home: HomePage(),
        initialRoute: 'home',
        routes: getApplicationRoutes(),
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            builder: (BuildContext context) => CardPage(),
          );
        });
  }
}
