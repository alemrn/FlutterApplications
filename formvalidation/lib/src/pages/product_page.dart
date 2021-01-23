import 'package:flutter/material.dart';
import 'package:formvalidation/src/utils/utils.dart' as utils;

class ProductPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Producto"),
        actions: [
          IconButton(
            icon: Icon(Icons.photo_size_select_actual),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                _crearNombre(),
                _crearPrecio(),
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
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Producto'),
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
      keyboardType: TextInputType.number,
      keyboardAppearance: Brightness.dark,
      decoration: InputDecoration(labelText: 'Producto'),
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
      onPressed: _submit,
    );
  }

  void _submit() {
    formKey.currentState.validate();
  }
}
