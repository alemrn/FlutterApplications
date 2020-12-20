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
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _crearInput(),
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: FlatButton(
              color: Colors.lime[800],
              child: Text(
                'Show QR',
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
              onPressed: () {
                _crearQrImage(context);
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: TextField(
        //autofocus: true,
        style: TextStyle(fontSize: 18.0),
        textAlign: TextAlign.center,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          hintText: 'QR Code',
        ),
        onChanged: (valor) {
          setState(() {
            _data = valor;
            print(_data);
          });
        },
      ),
    );
  }

  _crearQrImage(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          title: Text('QR Alert Dialog'),
          content: Column(
            children: [
              Text(
                'Qr Code with : $_data',
                textAlign: TextAlign.center,
                style: TextStyle(
                  backgroundColor: Colors.amber,
                  fontSize: 14,
                ),
              ),
              Container(
                width: _screenSize.width,
                height: _screenSize.height,
                child: Expanded(
                  child: QrImage(
                    data: _data,
                    version: QrVersions.auto,
                  ),
                ),
              ),
            ],
          ),
          actions: [
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
            ),
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, 'QRCode', arguments: _data);
              },
              child: Text(
                'Ok',
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _createButtons(IconData add) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Center(
        child: InkWell(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Container(
              color: Colors.black54,
              width: ((_screenSize.width > _screenSize.height)
                      ? _screenSize.height
                      : _screenSize.width) *
                  0.2,
              height: ((_screenSize.width > _screenSize.height)
                      ? _screenSize.height
                      : _screenSize.width) *
                  0.2,
              child: ClipRRect(
                child: Icon(add),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          onTap: () {
            print('Button pressed');
          },
        ),
      ),
    );
  }
}
