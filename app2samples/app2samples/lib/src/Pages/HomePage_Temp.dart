import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final opciones = ['Map', 'Options', 'Images', 'Videos', 'Share', 'Control'];

  HomePageTemp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Componentes')),
      body: ListView(children: _crearItemsCorto()),
    );
  }

  List<Widget> _crearItems() {
    List<Widget> lista = new List<Widget>();

    for (String item in opciones) {
      final widgettemp = ListTile(
        title: Text(item),
      );
      lista..add(widgettemp)..add(Divider());
    }

    return lista;
  }

  List<Widget> _crearItemsCorto() {
    return opciones.map((item) {
      return Column(
        children: [
          ListTile(
            leading: Icon(Icons.adb),
            title: Text(item + '!'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          Divider(),
        ],
      );
    }).toList();
  }
}
