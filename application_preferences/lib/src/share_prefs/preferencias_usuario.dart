import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _instance =
      new PreferenciasUsuario._internal();

  PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instance;
  }

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  get genero {
    return _prefs.getInt('genero') ?? 1;
  }

  set genero(int value) {
    _prefs.setInt('genero', value);
  }

  get nombre {
    return _prefs.getString('nombre') ?? 'Pedro';
  }

  set nombre(String value) {
    _prefs.setString('nombre', value);
  }

  get colorSecundario {
    return _prefs.getBool('color') ?? false;
  }

  set colorSecundario(bool value) {
    _prefs.setBool('color', value);
  }
}
