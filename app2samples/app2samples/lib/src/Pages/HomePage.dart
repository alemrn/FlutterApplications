import 'package:app2samples/src/Pages/alert_page.dart';
import 'package:app2samples/src/providers/menu_provider.dart';
import 'package:app2samples/src/utils/icon_string_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Componentes')),
      body: _lista(),
    );
  }

  Widget _lista() {
    return FutureBuilder(
      future: menuprovider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _crearListaItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _crearListaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];

    data.forEach((element) {
      final widgetTemp = ListTile(
        title: Text(element['texto']),
        leading: getIcon(element['icon']),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          // Navegar a una nueva actividad o pagina
          // final route = MaterialPageRoute(
          //   builder: (context) {
          //     return AlertPage();
          //   },
          // );
          // Navigator.push(context, route);

          Navigator.pushNamed(context, element["ruta"]);
        },
      );

      opciones.add(widgetTemp);
    });
    return opciones;
  }
}
