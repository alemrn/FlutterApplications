import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class CardSwiper extends StatelessWidget {
  final List<Pelicula> list;

  const CardSwiper({@required this.list});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Swiper(
        layout: SwiperLayout.TINDER,
        itemWidth: _screenSize.width * 0.7,
        itemHeight: _screenSize.height * 0.5,
        itemBuilder: (BuildContext context, int index) {
          list[index].uniqueId = '${list[index].id}-tarjeta';

          return Hero(
            tag: list[index].uniqueId,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: GestureDetector(
                child: FadeInImage(
                  placeholder: AssetImage('assets/tenor.gif'),
                  image: NetworkImage(list[index].getPosterImg()),
                  fit: BoxFit.cover,
                ),
                onTap: () {
                  Navigator.pushNamed(context, 'detalle',
                      arguments: list[index]);
                },
              ),
            ),
          );
        },
        itemCount: list.length,
      ),
    );
  }
}
