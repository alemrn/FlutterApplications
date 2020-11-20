abstract class persona{
  String _nombre;
  String _dni;
  String _tlf;
  
  String tostring();
}

class estudiante implements persona{
  
  String _universidad;
  String _nombre;
  String _dni;
  String _tlf;
  
  set universidad( String valor ){
    _universidad = valor;
  }
  
  set nombre( String valor ){
    _nombre = valor;
  }
  set dni ( String valor ){
    _dni = valor;
  }
  
  set tlf ( String valor ){
    _tlf = valor;
  }
  
  String get nombre => _nombre;
  String get universidad => _universidad;
  String get dni => _dni;
  String get tlf => _tlf;
  
  String tostring()=>"Nombre: " + _nombre + " dni: " + _dni + " tfl: " + _tlf + "universidad" + _universidad;
  
}

class profesional extends persona{
  String empresa;
   String tostring()=>"Nombre: " + _nombre + " dni: " + _dni + " tfl: " + _tlf + "empresa" + empresa;
}