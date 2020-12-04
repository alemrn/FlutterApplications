import 'dart:ui';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final estiloTitulo = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  final estiloSubtitulo = TextStyle(fontSize: 18.0, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _crearImagen(),
            _buildRow(),
            _buildActions(),
            _buildText(),
            _buildText(),
            _buildText(),
            _buildText(),
          ],
        ),
      ),
    );
  }

  Widget _buildRow() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Row(
          children: [
            Expanded(
              // Controla el espacio que queda restante con los demas widget y controla para que ocupe todo el espacio disponible
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Globos",
                    style: estiloTitulo,
                  ),
                  SizedBox(
                    height: 7.0,
                  ),
                  Text(
                    'globos aerostaticos',
                    style: estiloSubtitulo,
                  ),
                ],
              ),
            ),
            Icon(
              Icons.star,
              color: Colors.red,
              size: 30.0,
            ),
            Text(
              '4.2',
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }

  Widget _crearImagen() {
    return Container(
      width: double.infinity,
      child: Image(
        image: NetworkImage(
            'https://image.shutterstock.com/image-photo/colorful-hot-air-balloons-flying-260nw-1033306540.jpg'),
        height: 180.0,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _actions(Icons.call, 'call'),
        _actions(Icons.near_me, 'Route'),
        _actions(Icons.share, 'Share'),
      ],
    );
  }

  Widget _actions(IconData icon, String text) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.blue,
          size: 40.0,
        ),
        Text(
          text,
          style: TextStyle(color: Colors.blue),
        )
      ],
    );
  }

  Widget _buildText() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
      child: Text(
        'jskdlfjñalk sdlfknasdk jlaskdasjdk kajsdhf ajsdf hlkajsdfk adkhf akdsjfh ansjdlfna kdshiasd kjasdjkf asldñfa posufoq iwenlfkasdnv khaoisdf jlkasfd asdofihan skdfajoisd fjaskdhflasdhj vbjakcnmzñ joifupjeflna asdi oajlsdf akdsj dfk alsdsiasñdl jasdkfj lasdf',
        textAlign: TextAlign.justify,
      ),
    );
  }
}
