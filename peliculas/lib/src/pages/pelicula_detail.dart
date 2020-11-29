import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:peliculas/src/providers/actores_provider.dart';
import 'package:peliculas/src/widgets/actors_horizontal.dart';

class PeliculaDetail extends StatelessWidget {
  ActoresProvider actoresProvider = null;

  PeliculaDetail();

  @override
  Widget build(BuildContext context) {
    final Pelicula pelicula = ModalRoute.of(context).settings.arguments;
    actoresProvider = ActoresProvider.movieid(pelicula.id);
    actoresProvider.getCast(pelicula.id);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _crearAppBar(pelicula),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(
                  height: 10.0,
                ),
                _posterTitle(pelicula, context),
                SizedBox(
                  height: 10.0,
                ),
                _description(pelicula),
                SizedBox(
                  height: 10.0,
                ),
                _actores(pelicula, context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _crearAppBar(Pelicula pelicula) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.indigoAccent,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          pelicula.title,
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/tenor.gif'),
          image: NetworkImage(
            pelicula.getBackgroundImg(),
          ),
          fadeInDuration: Duration(milliseconds: 150),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _posterTitle(Pelicula pelicula, BuildContext context) {
    return Container(
        child: Row(
      children: [
        Hero(
          tag: pelicula.uniqueId,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image(
              image: NetworkImage(pelicula.getPosterImg()),
              height: 150.0,
            ),
          ),
        ),
        SizedBox(
          width: 20.0,
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                pelicula.title,
                style: Theme.of(context).textTheme.headline6,
                overflow: TextOverflow.ellipsis,
              ),
              Text(pelicula.originalTitle,
                  style: Theme.of(context).textTheme.subtitle1,
                  overflow: TextOverflow.ellipsis),
              Row(
                children: [
                  Icon(Icons.star),
                  Text(pelicula.voteAverage.toString())
                ],
              )
            ],
          ),
        ),
      ],
    ));
  }

  Widget _description(Pelicula pelicula) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: Text(
        pelicula.overview,
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _actores(
    Pelicula pelicula,
    BuildContext context,
  ) {
    return Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: 2.0),
              child: Text(
                'Populares',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            StreamBuilder(
              stream: actoresProvider.actoresStream,
              builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                if (snapshot.hasData)
                  return CastHorizontal(
                    actores: snapshot.data,
                    siguientepagina: actoresProvider.getCast,
                  );
                else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            )
          ],
        ));
  }
}
