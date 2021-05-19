import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServerStatus { Online, Offline, Connnectig }

class SocketService with ChangeNotifier {
  IO.Socket _socket;
  ServerStatus _serverStatus = ServerStatus.Connnectig;
  SocketService() {
    this._initConfig();
  }

  void _initConfig() {
    print("Inicialización de SocketService");
    this._socket = IO.io('http://192.168.18.4:3000', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': true,
    });

    _socket.on('connect', (_) {
      this._serverStatus = ServerStatus.Online;
      notifyListeners();
    });

    _socket.on('disconnect', (_) {
      this._serverStatus = ServerStatus.Offline;
      notifyListeners();
    });

    _socket.on('new-message', (payload) {
      print('new-message: $payload');
      print('Nombre: ' + payload['nombre']);
      print('Mensaje: ' + payload['mensaje']);
    });

    this._socket.connect();
  }

  ServerStatus get serverStatus => this._serverStatus;
  IO.Socket get socket => this._socket;
  Function get emit => this._socket.emit;
}
