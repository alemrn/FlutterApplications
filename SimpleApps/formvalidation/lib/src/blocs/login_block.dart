import 'dart:async';

import 'package:formvalidation/src/blocs/validator.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with validator {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  //Reuperar los datos del Stream

  Stream<String> get emailStream =>
      _emailController.stream.transform(validarEmail);
  Stream<String> get passwordStream =>
      _passwordController.stream.transform(validarPassword);

  Stream<bool> get formValidStream =>
      CombineLatestStream.combine2(emailStream, passwordStream, (a, b) => true);

  //Insertar valores al stream
  get changeEmail => _emailController.sink.add;
  get changePassword => _passwordController.sink.add;

  // Obtener el último valor ingresado a los streams

  String get email => _emailController.value;
  String get password => _passwordController.value;

  dispose() {
    _emailController?.close();
    _passwordController?.close();
  }
}
