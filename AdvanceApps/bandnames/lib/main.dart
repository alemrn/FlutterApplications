import 'package:bandnames/pages/status.dart';
import 'package:bandnames/services/Socket_service.dart';
import 'package:flutter/material.dart';

import 'package:bandnames/pages/home.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SocketService(),
        ),
      ],
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (BuildContext context) => HomePage(),
          '/status': (BuildContext context) => StatusPage(),
        },
      ),
    );
  }
}
