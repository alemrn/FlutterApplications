import 'dart:convert';
import 'dart:io';

import 'package:formvalidation/preferences/preferencias_usuario.dart';
import 'package:formvalidation/src/model/producto_model.dart';
import 'package:http/http.dart' as http;

class ProductosProvider {
  final String _url =
      'https://flutter-udemy-course-5bb4c-default-rtdb.firebaseio.com';
  final _prefs = new PreferenciasUsuario();

  Future<bool> crearProducto(ProductoModel producto) async {
    final String url = '$_url/productos.json';
    final resp = await http.post(url, body: productoModelToJson(producto));
    final decodedData = json.decode(resp.body);
    print(decodedData);
    return true;
  }

  Future<List<ProductoModel>> cargarProductos() async {
    final String url = '$_url/productos.json?auth=${_prefs.token}';
    final resp = await http.get(url);
    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final List<ProductoModel> productos = [];
    if (decodedData == null) return productos;

    decodedData.forEach((id, prod) {
      final prodtemp = ProductoModel.fromJson(prod);
      prodtemp.id = id;
      productos.add(prodtemp);
    });

    print(productos);
    return productos;
  }

  Future<bool> editarProducto(ProductoModel producto) async {
    final url = '$_url/productos/${producto.id}.json?auth=${_prefs.token}';

    final res = await http.put(url, body: productoModelToJson(producto));

    final decodedData = json.decode(res.body);

    print(decodedData);

    return true;
  }

  Future<int> deleteProduct(String id) async {
    final String url = '$_url/productos/$id.json?auth=${_prefs.token}';
    final resp = await http.delete(url);

    print(json.decode(resp.body));
    return 1;
  }

  Future<String> subirImagen(File imagen) async {
    final url = Uri.parse('SubirImagen url');
  }
}
