import 'package:flutter/material.dart';

class ScrollPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
      scrollDirection: Axis.vertical,
      children: [_page1(), _page2()],
    ));
  }

  Widget _page1() {
    return Stack(
      children: [
        _colorFondo(),
        _imagefond(),
        _texts(),
      ],
    );
  }

  Widget _colorFondo() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(108, 192, 218, 1.8),
    );
  }

  Widget _page2() {
    return Stack(
      children: [
        _colorFondo(),
        _buildButton(),
      ],
    );
  }

  _imagefond() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image(
        image: AssetImage('assets/scroll-1.png'),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _texts() {
    final estilotexto = TextStyle(color: Colors.white, fontSize: 50.0);

    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: 20.0,
          ),
          Text(
            '11º',
            style: estilotexto,
          ),
          Text(
            'Wednesday',
            style: estilotexto,
          ),
          Expanded(child: Container()),
          Icon(Icons.keyboard_arrow_down, size: 70.0, color: Colors.white),
        ],
      ),
    );
  }

  Widget _buildButton() {
    return Center(
      child: RaisedButton(
        shape: StadiumBorder(),
        onPressed: () {},
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
          child: Text(
            'Bienvenidos',
            style: TextStyle(fontSize: 20.0),
          ),
        ),
        color: Colors.blue,
        textColor: Colors.white,
      ),
    );
  }
}
