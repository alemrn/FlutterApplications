import 'dart:convert';

import 'package:chatapp/Global/env.dart';
import 'package:chatapp/models/Login_response.dart';
import 'package:chatapp/models/ususarios.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService with ChangeNotifier {
  Usuario usuario;
  bool _autenticando = false;

  bool get autenticando => this._autenticando;

  set autenticando(bool valor) {
    this._autenticando = valor;
    notifyListeners();
  }

  Future login(String email, String password) async {
    final data = {'email': email, 'password': password};
    Uri uri = Uri.parse('${Env.apiUrl}/login/login');

    print(uri);
    final resp = await http.post(uri, body: jsonEncode(data), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });
    print(resp.body);
    if (resp.statusCode == 200) {
      final loginResponse = loginResponseFromJson(resp.body);
      this.usuario = loginResponse.usuario;
    }
    this.autenticando = false;
  }
}
