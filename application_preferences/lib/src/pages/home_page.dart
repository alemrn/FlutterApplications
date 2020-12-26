import 'package:application_preferences/src/widget/Menu_widget.dart';
import 'package:flutter/material.dart';
import '../share_prefs/preferencias_usuario.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'Home';
  final prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    //Modificaciones para la obtención de las preferencias del usuario.
    prefs.ultimaPagina = HomePage.routeName;
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Color secundario:${prefs.colorSecundario}'),
          Divider(),
          Text('Genero: ${prefs.genero}'),
          Divider(),
          Text('Nombre Usuario:${prefs.nombre}'),
          Divider(),
        ],
      ),
    );
  }
}
