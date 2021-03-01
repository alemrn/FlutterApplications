import 'package:application_preferences/src/pages/home_page.dart';
import 'package:application_preferences/src/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:application_preferences/src/share_prefs/preferencias_usuario.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prefs = new PreferenciasUsuario();
    return MaterialApp(
      title: 'Preferences',
      initialRoute: HomePage.routeName,
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.routeName: (_) => HomePage(),
        SettingsPage.routeName: (_) => SettingsPage(),
      },
    );
  }
}
