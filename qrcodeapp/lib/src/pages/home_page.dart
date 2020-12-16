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
          _crearInput(),
          Divider(),
          FlatButton(
            color: Colors.black,
            child: Text('Show QR'),
            onPressed: () {
              _crearQrImage(context);
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

  _crearQrImage(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text('QR Alert Dialog'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Qr Code with : $_data'),
              Divider(),
              Text(
                'Data ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  backgroundColor: Colors.amber,
                  fontSize: 14,
                ),
              ),
              Container(
                width: _screenSize.width,
                height: _screenSize.height,
                child: QrImage(
                  data: _data,
                  version: QrVersions.auto,
                ),
              ),
            ],
          ),
          actions: [
            FlatButton(
              onPressed: () {},
              child: Text('Cancel'),
            ),
            FlatButton(
              onPressed: () {},
              child: Text('Ok'),
            ),
          ],
        );
      },
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
        onTap: () {
          print('Button pressed');
        },
      ),
    );
  }
}
