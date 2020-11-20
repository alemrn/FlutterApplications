class Cuadrado{
  double _lado;
  
  set lado( double valor){
    if(valor <= 0){
      throw ("el valor no puede ser 0 o menor que 0");
    }else{
      _lado =  valor;
    }
  } 
  
  double get area => _lado * _lado;
  
}

void main() {
  final cuadrado = new Cuadrado();
  final cuadrado2 = new Cuadrado();
  cuadrado.lado = 10;
  cuadrado2.lado = 0;
  
  print(cuadrado.area);
  
  
}