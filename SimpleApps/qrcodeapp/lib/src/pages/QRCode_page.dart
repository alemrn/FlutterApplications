import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodePage extends StatelessWidget {
  String _data = "";

  @override
  Widget build(BuildContext context) {
    _data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Center(
        child: GestureDetector(
          child: QrImage(
            data: _data,
            version: QrVersions.auto,
          ),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
