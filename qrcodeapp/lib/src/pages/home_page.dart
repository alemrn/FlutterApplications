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
      body: Column(
        children: [
          Divider(),
          Row(
            children: [
              _crearInput(),
            ],
          ),
          Divider(),
          //_crearQrImage(),
          FlatButton(
            color: Colors.black,
            child: Text('Show QR'),
            onPressed: () {
              print('Show QR Button pressed');
            },
          ),
          Row(
            children: [
              _createButtons(Icons.add),
              _createButtons(Icons.remove),
            ],
          ),
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      //autofocus: true,
      style: TextStyle(fontSize: 18.0),
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        hintText: 'QRData',
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

  Widget _createButtons(IconData add) {
    return Center(
      child: InkWell(
        child: Container(
          color: Colors.black54,
          width: 40,
          height: 40,
          child: ClipRRect(
            child: Icon(add),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onTap: (){
          print('Button pressed');
        },
      ),
    );
  }
}
