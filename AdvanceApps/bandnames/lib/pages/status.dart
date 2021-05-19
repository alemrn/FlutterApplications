import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bandnames/services/Socket_service.dart';

class StatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final socketService = Provider.of<SocketService>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Server status: ${socketService.serverStatus}'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //{nombre: 'Flutter', mensaje: 'Hola Desde Flutter'}
          socketService.emit('new-message', {'nombre': 'Flutter', 'mensaje':'Hola desde Flutter'});
        },
        child: Icon(Icons.message),
      ),
    );
  }
}
