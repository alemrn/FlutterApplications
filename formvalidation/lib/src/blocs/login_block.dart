import 'dart:async';

import 'package:formvalidation/src/blocs/validator.dart';

class LoginBloc with validator {
  final _emailController = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();

  //Reuperar los datos del Stream

  Stream<String> get emailStream =>
      _emailController.stream.transform(validarEmail);
  Stream<String> get passwordStream =>
      _passwordController.stream.transform(validarPassword);

  //Insertar valores al stream
  get changeEmail => _emailController.sink.add;
  get changePassword => _passwordController.sink.add;

  dispose() {
    _emailController?.close();
    _passwordController?.close();
  }
}
