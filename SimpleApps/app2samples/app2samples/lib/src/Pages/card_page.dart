import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cards')),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(
            height: 10.0,
          ),
          _cardTipo1(),
          SizedBox(
            height: 10.0,
          ),
          _cardTipo2(),
          SizedBox(
            height: 10.0,
          ),
          _cardTipo1(),
          SizedBox(
            height: 10.0,
          ),
          _cardTipo2(),
          SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text('Card Sample'),
            subtitle: Text(
                'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaaaaaaaaaaa'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(onPressed: null, child: Text('Cancelar')),
              FlatButton(onPressed: null, child: Text('Ok')),
            ],
          )
        ],
      ),
      elevation: 10,
    );
  }

  Widget _cardTipo2() {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: [
          FadeInImage(
            placeholder: AssetImage('assets/tenor.gif'),
            image: NetworkImage(
                'https://photographylife.com/wp-content/uploads/2017/01/What-is-landscape-photography.jpg'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover,
          ),
          Container(
              padding: EdgeInsets.all(10.0),
              child: Text('No Tengo idea de que poner')),
        ],
      ),
      elevation: 10,
      borderOnForeground: true,
    );
  }
}
