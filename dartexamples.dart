import 'dart:convert';

class empleado {
  String nombre;
  String dni;

  empleado(String nombre, String dni) {
    this.nombre = nombre;
    this.dni = dni;
  }

  int number() {
    return 2;
  }
}

class heroe {
  String _nombre;
  int _code;

  heroe({String nombre = " ", int code = 0}) {
    this._nombre = nombre;
    this._code = code;
  }

  // estilo de Css, es una subfunción de el contrustor principal.
  // se le denomina constructores con nombre.
  heroe.fromjson(Map heroe) {
    _nombre = heroe["nombre"];
    _code = heroe["code"];
  }

  String getNombre() {
    return _nombre;
  }

  int getCode() {
    return _code;
  }

  String tostring() => "Nmbre" + _nombre;
}

void main() {
  empleado Juan = empleado("Juan", "q2riqsf");
  empleado Alejandro = empleado("Alejandro", "asjfds");

  final finaljson = '{"nombre":"spiderman", "code":1}';
  Map parsed = json.decode(finaljson);

  print(parsed);

  heroe spiderman = new heroe.fromjson(parsed);
  print(spiderman.tostring());
//   heroe logan = new heroe(nombre: "logan", code: 1);
//   print(logan.tostring());

  print(Juan.nombre);

  List<empleado> empleados = new List<empleado>();

  print(empleados);

  empleados.add(Juan);
  empleados.add(Alejandro);

  Map<String, dynamic> persona = new Map();

  persona["nombre"] = "Alejandro";
  persona["dni"] = 1245284;
  persona["tlf"] = "wrtqiwr";

  print(persona);

  print(persona["dni"]);

  print(Juan.number());
}
