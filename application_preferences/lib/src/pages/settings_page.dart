import 'package:application_preferences/src/widget/Menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:application_preferences/src/share_prefs/preferencias_usuario.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'Settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _colorsecundario;
  int _genero;
  String _nombre;
  TextEditingController _textController;

  final prefs = new PreferenciasUsuario();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    prefs.ultimaPagina = SettingsPage.routeName;

    _nombre = prefs.nombre;
    _genero = prefs.genero;
    _colorsecundario = prefs.colorSecundario;

    _textController = new TextEditingController(text: _nombre);
  }

  void _setSelectedRadio(int value) {
    _genero = value;
    prefs.genero = value;
    setState(() {});
  }

  void _setSelectedSwitch(bool value) {
    _colorsecundario = value;
    prefs.colorSecundario = value;
    setState(() {});
  }

  void _setChangedName(String value) {
    _nombre = value;
    prefs.nombre = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text(
              'Settings',
              style: TextStyle(
                fontSize: 45.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(),
          SwitchListTile(
            onChanged: _setSelectedSwitch,
            value: _colorsecundario,
            title: Text('Color Secundario'),
          ),
          RadioListTile(
            value: 1,
            title: Text('Masculino'),
            groupValue: _genero,
            onChanged: _setSelectedRadio,
          ),
          RadioListTile(
            value: 2,
            title: Text('Femenino'),
            groupValue: _genero,
            onChanged: _setSelectedRadio,
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                helperText: 'Nombre de la persona usando el teléfono',
              ),
              onChanged: _setChangedName,
            ),
          )
        ],
      ),
    );
  }
}
