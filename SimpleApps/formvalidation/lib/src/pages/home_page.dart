import 'package:flutter/material.dart';
import 'package:formvalidation/src/blocs/provider.dart';
import 'package:formvalidation/src/model/producto_model.dart';
import 'package:formvalidation/src/providers/producto_provider.dart';

class HomePage extends StatelessWidget {
  final productoProvider = new ProductosProvider();

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('home'),
      ),
      body: _crearListado(),
      floatingActionButton: _createButton(context),
    );
  }

  _crearListado() {
    return FutureBuilder(
      future: productoProvider.cargarProductos(),
      builder:
          (BuildContext context, AsyncSnapshot<List<ProductoModel>> snapshot) {
        if (snapshot.hasData) {
          final productos = snapshot.data;
          return ListView.builder(
            itemCount: productos.length,
            itemBuilder: (context, index) =>
                _crearItem(context, productos[index]),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  Widget _crearItem(BuildContext context, ProductoModel producto) {
    return Dismissible(
      key: UniqueKey(),
      child: ListTile(
        title: Text(producto.titulo + ' - ${producto.valor}'),
        subtitle: Text(producto.id),
        onTap: () =>
            Navigator.pushNamed(context, 'product', arguments: producto),
      ),
      background: Container(
        color: Colors.red,
      ),
      onDismissed: (direction) => productoProvider.deleteProduct(producto.id),
    );
  }

  _createButton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: Colors.deepPurple,
      onPressed: () => Navigator.pushNamed(context, 'product'),
    );
  }
}
