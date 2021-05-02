import 'package:flutter/material.dart';
import 'package:peliculas/src/models/actores_models.dart';

class CastHorizontal extends StatelessWidget {
  final List<Actor> actores;

  final Function siguientepagina;
  CastHorizontal({@required this.actores, @required this.siguientepagina});

  final _pageController = new PageController(
    initialPage: 1,
    viewportFraction: 0.2,
  );

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    _pageController.addListener(() {
      if (_pageController.position.pixels >=
          _pageController.position.maxScrollExtent - 200) {
        siguientepagina();
      }
    });

    return Container(
      height: _screenSize.height * 0.2,
      child: PageView.builder(
        pageSnapping: false,
        controller: _pageController,
        // children: _tarjetas(context),
        itemCount: actores.length,
        itemBuilder: (context, i) {
          return _tarjeta(context, actores[i]);
        },
      ),
    );
  }

  Widget _tarjeta(BuildContext context, Actor actor) {
    final tarjeta = Container(
      margin: EdgeInsets.only(right: 5.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: FadeInImage(
              placeholder: AssetImage('assets/tenor.gif'),
              image: NetworkImage(actor.getFoto()),
              fit: BoxFit.cover,
              height: 100.0,
            ),
          ),
          SizedBox(),
          Text(actor.name,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.caption),
        ],
      ),
    );

    return GestureDetector(
      child: tarjeta,
      onTap: () {
        print('ID de la pelicula ${actor.name}');
        Navigator.pushNamed(context, 'detalle', arguments: actor);
      },
    );
  }

  List<Widget> _tarjetas(BuildContext context) {
    return actores.map((actor) {
      return Container(
        margin: EdgeInsets.only(right: 5.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                placeholder: AssetImage('assets/tenor.gif'),
                image: NetworkImage(actor.getFoto()),
                fit: BoxFit.cover,
                height: 100.0,
              ),
            ),
            SizedBox(),
            Text(actor.name,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.caption),
          ],
        ),
      );
    }).toList();
  }
}
