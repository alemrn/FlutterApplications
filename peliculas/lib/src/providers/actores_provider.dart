import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:peliculas/src/models/actores_models.dart';

class ActoresProvider {
  String _apikey = 'c0af1d39305f80e729097bccadd5b700';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';

  int movieId = 0;

  List<Actor> _actores = new List();
  bool _cargando = false;

  final _actoresStreamController = StreamController<List<Actor>>.broadcast();

  ActoresProvider.movieid(int id) {
    this.movieId = id;
  }

  Function(List<Actor>) get actoresSink => _actoresStreamController.sink.add;

  Stream<List<Actor>> get actoresStream => _actoresStreamController.stream;

  void disposeStream() {
    _actoresStreamController.close();
  }

  Future<List<Actor>> getCast(int movieId) async {
    if (_cargando) return [];
    _cargando = true;
    // print('cargando siguientes');
    final url = Uri.https(_url, '3/movie/$movieId/credits',
        {'api_key': _apikey, 'language': _language});

    final resp = await getActores(url);

    _actores.addAll(resp);
    actoresSink(_actores);

    _cargando = false;
    return resp;
  }

  Future<List<Actor>> getActores(final url) async {
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final actores = new Actores.fromJsonList(decodedData['cast']);

    return actores.actores;
  }
}
