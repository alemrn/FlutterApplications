import 'dart:async';

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  ListaPage({Key key}) : super(key: key);

  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  ScrollController _listcontroller = new ScrollController();
  List<int> _listanumeros = new List();
  int _ultimoItem = 0;
  bool _isloading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _agregar10();

    _listcontroller.addListener(() {
      if (_listcontroller.position.pixels ==
          _listcontroller.position.maxScrollExtent) {
        //  _agregar10();
        fechData();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _listcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('List view'),
        ),
        body: Stack(
          children: [
            _crearlista(),
            _crearLoading(),
          ],
        ));
  }

  Widget _crearlista() {
    return ListView.builder(
      controller: _listcontroller,
      itemCount: _listanumeros.length,
      itemBuilder: (BuildContext context, int index) {
        final imagen = _listanumeros[index];
        return FadeInImage(
          placeholder: AssetImage('assets/tenor.gif'),
          image: NetworkImage('https://picsum.photos/500/300/?image=$imagen'),
        );
      },
    );
  }

  void _agregar10() {
    for (var i = 1; i < 10; i++) {
      _ultimoItem++;
      _listanumeros.add(_ultimoItem);
    }
    setState(() {});
  }

  Future<Null> fechData() async {
    _isloading = true;

    setState(() {});

    final duration = new Duration(seconds: 2);
    return new Timer(duration, respuestaHTTP);
  }

  void respuestaHTTP() {
    _isloading = false;
    _agregar10();
    _listcontroller.animateTo(
      _listcontroller.position.pixels + 100,
      duration: Duration(milliseconds: 250),
      curve: Curves.fastOutSlowIn,
    );
  }

  Widget _crearLoading() {
    if (_isloading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              CircularProgressIndicator(
                backgroundColor: Colors.orange,
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          SizedBox(
            height: 15.0,
          )
        ],
      );
    } else {
      return Container();
    }
  }
}
