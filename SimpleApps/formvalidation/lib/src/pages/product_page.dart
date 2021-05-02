import 'dart:io';

import 'package:flutter/material.dart';
import 'package:formvalidation/src/model/producto_model.dart';
import 'package:formvalidation/src/providers/producto_provider.dart';
import 'package:formvalidation/src/utils/utils.dart' as utils;
import 'package:image_picker/image_picker.dart';

class ProductPage extends StatefulWidget {
  // clave para el formulario
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final formKey = GlobalKey<FormState>();
  final scaffoldkey = GlobalKey<ScaffoldState>();
  ProductoModel producto = new ProductoModel();
  final productoProvider = new ProductosProvider();
  File foto;
  bool _saving = false;

  @override
  Widget build(BuildContext context) {
    final ProductoModel prodData = ModalRoute.of(context).settings.arguments;

    if (prodData != null) {
      producto = prodData;
    }

    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(
        title: Text("Producto"),
        actions: [
          IconButton(
            icon: Icon(Icons.photo_size_select_actual),
            onPressed: _seleccionarFoto,
          ),
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: _tomarfoto,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey, // identificador único del formulario
            child: Column(
              children: [
                _mostrarFoto(),
                _crearNombre(),
                _crearPrecio(),
                _crearDisponible(),
                _crearButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _crearNombre() {
    return TextFormField(
      initialValue: producto.titulo,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Producto'),
      onSaved: (value) => producto.titulo = value,
      validator: (value) {
        if (value.length < 3) {
          return 'Ingrese el nombre del producto';
        } else {
          return null;
        }
      },
    );
  }

  _crearPrecio() {
    return TextFormField(
      initialValue: producto.valor.toString(),
      keyboardType: TextInputType.number,
      keyboardAppearance: Brightness.dark,
      decoration: InputDecoration(labelText: 'Precio'),
      onSaved: (newValue) => producto.valor = double.parse(newValue),
      validator: (value) {
        return utils.isNumeric(value) ? null : "Error contiene letras";
      },
    );
  }

  _crearButton() {
    return RaisedButton.icon(
      icon: Icon(Icons.save),
      label: Text('Save'),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      color: Colors.deepPurple,
      textColor: Colors.white,
      onPressed: (_saving) ? null : _submit,
    );
  }

  void _submit() {
    // hace referencia al formulario que está en el single child scroll view
    if (!formKey.currentState.validate()) return;

    // Cuando el formulario es valido

    formKey.currentState.save();
    print('Todo ok');
    print(producto.titulo + " - " + producto.valor.toString());
    print(producto.disponible);

    setState(() {
      _saving = true;
    });

    if (producto.id == null) {
      productoProvider.crearProducto(producto);
    } else {
      productoProvider.editarProducto(producto);
    }
    //setState(() {_saving = false;});
    showSnackbar('Producto creado');

    Navigator.pop(context);
  }

  _crearDisponible() {
    return SwitchListTile(
      value: producto.disponible,
      title: Text('Disponible'),
      activeColor: Colors.deepPurple,
      onChanged: (value) => setState(
        () {
          producto.disponible = value;
        },
      ),
    );
  }

  _mostrarFoto() {
    if (producto.fotoUrl != null) {
      // TODO: ARREGLAR ESTO
      return Container();
    } else {
      return Image(
        image: AssetImage(foto?.path ?? 'assets/no-image.png'),
        height: 300.0,
        fit: BoxFit.cover,
      );
    }
  }

  void showSnackbar(String message) {
    final snackbar = SnackBar(
      content: Text(message),
      duration: Duration(milliseconds: 1500),
    );
    scaffoldkey.currentState.showSnackBar(snackbar);
  }

  void _seleccionarFoto() async {
    _procesarImagen(ImageSource.gallery);
  }

  void _tomarfoto() async {
    _procesarImagen(ImageSource.camera);
  }

  _procesarImagen(ImageSource tipo) async {
    final pickedFile = await ImagePicker().getImage(source: tipo);

    if (pickedFile != null) {
      // limpieza
      foto = File(pickedFile.path);
    }
    setState(() {});
  }
}
