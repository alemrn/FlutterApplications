import 'package:flutter/material.dart';
import 'package:newsapp/src/models/NewsResponseModel.dart';
import 'package:newsapp/src/theme/theme.dart';

class ListaNoticias extends StatelessWidget {
  final List<Article> noticias;
  const ListaNoticias({@required this.noticias});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return _Noticia(noticia: this.noticias[index], index: index);
      },
      itemCount: noticias.length,
    );
  }
}

class _Noticia extends StatelessWidget {
  final Article noticia;

  final int index;

  const _Noticia({Key key, @required this.noticia, @required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _tarjetatopBar(noticia, index),
        _tarjetatitulo(noticia),
        _tarjetaImagen(noticia),
        _tarjetaBody(noticia),
        SizedBox(
          height: 10,
        ),
        Divider(),
        _tarjetaBottones(),
      ],
    );
  }
}

class _tarjetaBottones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RawMaterialButton(
            onPressed: () {},
            fillColor: theme.accentColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(Icons.star_border),
          ),
          SizedBox(
            width: 10,
          ),
          RawMaterialButton(
            onPressed: () {},
            fillColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(Icons.more),
          ),
        ],
      ),
    );
  }
}

class _tarjetaBody extends StatelessWidget {
  final Article noticia;

  const _tarjetaBody(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text((noticia.description != null) ? noticia.description : ''),
    );
  }
}

class _tarjetatopBar extends StatelessWidget {
  final Article noticia;
  final int index;
  const _tarjetatopBar(this.noticia, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(
            '${index + 1}',
            style: TextStyle(color: theme.accentColor),
          ),
          Text(
            '${noticia.source.name}',
          ),
        ],
      ),
    );
  }
}

class _tarjetaImagen extends StatelessWidget {
  final Article noticia;

  const _tarjetaImagen(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
        child: Container(
          child: (noticia.urlToImage != null)
              ? FadeInImage(
                  placeholder: AssetImage('assets/giphy.gif'),
                  image: NetworkImage(noticia.urlToImage),
                )
              : Image(
                  image: AssetImage('assets/no-image.png'),
                ),
        ),
      ),
    );
  }
}

class _tarjetatitulo extends StatelessWidget {
  final Article noticia;

  const _tarjetatitulo(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        noticia.title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
  }
}
