import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class BotonesPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            _backgroundApp(),
            SingleChildScrollView(
              child: Column(
                children: [
                  _title(),
                  _botonesRedondeados(),
                ],
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: Color.fromRGBO(55, 57, 84, 1.0),
      //   items: <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       title: Container(),
      //       icon: Icon(
      //         Icons.calendar_today,
      //       ),
      //     ),
      //     BottomNavigationBarItem(
      //       title: Container(),
      //       icon: Icon(
      //         Icons.pie_chart_outlined,
      //       ),
      //     ),
      //     BottomNavigationBarItem(
      //       title: Container(),
      //       icon: Icon(
      //         Icons.supervisor_account,
      //       ),
      //     ),
      //   ],
      //   fixedColor: Colors.pinkAccent,
      // ),
      bottomNavigationBar: _bottomnavigationBar(context),
    );
  }

  Widget _backgroundApp() {
    final gradiente = Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: FractionalOffset(0.0, 0.5),
            end: FractionalOffset(0.0, 1.0),
            colors: [
              Color.fromRGBO(52, 54, 101, 1.0),
              Color.fromRGBO(35, 37, 57, 1.0)
            ]),
      ),
    );

    final caja = Transform.rotate(
      angle: -pi / 5.0,
      child: Container(
        height: 300.0,
        width: 300.0,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromRGBO(236, 98, 188, 1.0),
            Color.fromRGBO(241, 142, 172, 1.0),
          ]),
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
    );

    return Stack(
      children: [
        gradiente,
        Positioned(
          child: caja,
          top: -100,
          left: -10,
        ),
      ],
    );
  }

  Widget _title() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Classify transaction',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Classify this transaction ito a particular category',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomnavigationBar(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Color.fromRGBO(55, 57, 84, 1.0),
        primaryColor: Colors.pinkAccent,
        textTheme: Theme.of(context).textTheme.copyWith(
              caption: TextStyle(
                color: Color.fromRGBO(116, 117, 152, 1.0),
              ),
            ),
      ),
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_rounded, size: 30.0),
            title: Container(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bubble_chart, size: 30.0),
            title: Container(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.admin_panel_settings, size: 30.0),
            title: Container(),
          ),
        ],
      ),
    );
  }

  _botonesRedondeados() {
    return Table(
      children: [
        TableRow(
          children: [
            _crearBotonRedondeado(Colors.blue, Icons.border_all, 'General'),
            _crearBotonRedondeado(
                Colors.purple, Icons.directions, 'Directions'),
          ],
        ),
        TableRow(
          children: [
            _crearBotonRedondeado(
                Colors.orange, Icons.add_photo_alternate, 'Photo'),
            _crearBotonRedondeado(Colors.pink, Icons.add_chart, 'Chart'),
          ],
        ),
      ],
    );
  }

  Widget _crearBotonRedondeado(Color color, IconData icon, String text) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
        child: Container(
          height: 180.0,
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Color.fromRGBO(62, 66, 107, 0.6),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 5.0,
              ),
              CircleAvatar(
                backgroundColor: color,
                radius: 35.0,
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              Text(
                text,
                style: TextStyle(color: color),
              ),
              SizedBox(
                height: 5.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
