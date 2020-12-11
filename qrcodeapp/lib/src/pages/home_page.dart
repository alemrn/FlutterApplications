import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:qr_flutter/qr_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Size _screenSize;
  String _data = "";

  @override
  Widget build(BuildContext context) {
    _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('QrApplication'),
      ),
      body: Column(children: [
        Divider(),
        _crearInput(),
        Divider(),
        _crearQrImage(),
      ]),
    );
  }

  Widget _crearInput() {
    return TextField(
      //autofocus: true,
      style: TextStyle(fontSize: 18.0),
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 16.0, color: Colors.lightBlue.shade50),
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: 'Texto de sugerencia',
        labelText: 'QRData',
        helperText: 'Solo el nombre',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
      ),
      onChanged: (valor) {
        setState(() {
          _data = valor;
          print(_data);
        });
      },
    );
  }

  _crearQrImage() {
    return Container(
      child: QrImage(
        data: _data,
        version: QrVersions.auto,
        size: _screenSize.width,
      ),
    );
  }
}
