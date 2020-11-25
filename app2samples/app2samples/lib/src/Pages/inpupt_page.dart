import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputPage extends StatefulWidget {
  InputPage({Key key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';
  String _email = '';
  String _password = '';

  String _fecha = '';
  String _selectedOption = 'Volar';

  List<String> _poderes = ['Volar', 'RayosX', 'Aliento', 'Fuerza'];

  TextEditingController _inputfiledDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inputs page')),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: [
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropDown(),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      //autofocus: true,
      style: TextStyle(fontSize: 18.0),
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 16.0, color: Colors.lightBlue.shade50),
          borderRadius: BorderRadius.circular(10),
        ),
        counter: Text('Letras ${_nombre.length}'),
        hintText: 'Texto de sugerencia',
        labelText: 'Nombre',
        helperText: 'Solo el nombre',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
      ),
      onChanged: (valor) {
        setState(() {
          _nombre = valor;
          print(_nombre);
        });
      },
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('Nombre es: $_nombre'),
      subtitle: Text('Email : $_email'),
      trailing: Text('Poder: $_selectedOption'),
    );
  }

  Widget _crearEmail() {
    return TextField(
      //autofocus: true,
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(fontSize: 18.0),
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 16.0, color: Colors.lightBlue.shade50),
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: 'Aquí para añadir su email',
        labelText: 'Email',
        helperText: 'Introduzca un email valido',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email),
      ),
      onChanged: (valor) {
        setState(() {
          _email = valor;
          print(_email);
        });
      },
    );
  }

  Widget _crearPassword() {
    return TextField(
      //autofocus: true,
      obscureText: true,
      style: TextStyle(fontSize: 18.0),
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 16.0, color: Colors.lightBlue.shade50),
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: 'Texto de sugerencia',
        labelText: 'Nombre',
        helperText: 'Solo el nombre',
        suffixIcon: Icon(Icons.security),
        icon: Icon(Icons.security_rounded),
      ),
      onChanged: (valor) {
        setState(() {
          _password = valor;
          print(_nombre);
        });
      },
    );
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      controller: _inputfiledDateController,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 16.0, color: Colors.lightBlue.shade50),
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: 'Fecha de nacimiento',
        labelText: 'Fecha',
        helperText: 'Fecha valida',
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon: Icon(Icons.calendar_today),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(1990),
      lastDate: new DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputfiledDateController.text = _fecha;
      });
    }
  }

  List<DropdownMenuItem<String>> getOpcionesDropDrown() {
    List<DropdownMenuItem<String>> lista = new List();

    _poderes.forEach((poder) {
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    });
    return lista;
  }

  Widget _crearDropDown() {
    return Row(
      children: [
        Icon(Icons.select_all),
        SizedBox(
          width: 30.0,
        ),
        DropdownButton(
            value: _selectedOption,
            items: getOpcionesDropDrown(),
            onChanged: (opt) {
              print(opt);
              setState(() {
                _selectedOption = opt;
              });
            }),
      ],
    );
  }
}
