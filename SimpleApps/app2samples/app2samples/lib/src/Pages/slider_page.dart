import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _sliderValue = 100.0;
  bool _bloquearSlider = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            _crearSlider(),
            _crearCheckBox(),
            Expanded(child: _crearImagen()),
            _crearSwitch(),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
        activeColor: Colors.indigoAccent,
        label: 'Tamaño de la imagen: $_sliderValue',
        value: _sliderValue,
        min: 10.0,
        max: 400.0,
        onChanged: (_bloquearSlider)
            ? null
            : (newvalue) {
                setState(() {
                  _sliderValue = newvalue;
                  print(_sliderValue);
                });
              });
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage(
          'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/gettyimages-837557442-1577228105.jpg'),
      width: _sliderValue,
      fit: BoxFit.contain,
    );
  }

  Widget _crearCheckBox() {
    // return Checkbox(
    //     value: _bloquearSlider,
    //     onChanged: (valor) {
    //       setState(() {
    //         _bloquearSlider = valor;
    //       });
    //     });
    return CheckboxListTile(
        title: Text('Bloquear slider'),
        value: _bloquearSlider,
        onChanged: (valor) {
          setState(() {
            _bloquearSlider = valor;
          });
        });
  }

  Widget _crearSwitch() {
    return SwitchListTile(
        title: Text('Bloquear slider'),
        value: _bloquearSlider,
        onChanged: (valor) {
          setState(() {
            _bloquearSlider = valor;
          });
        });
  }
}
