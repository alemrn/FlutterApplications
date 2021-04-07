import 'package:flutter/material.dart';
import 'package:headers/src/widget/radial_progress.dart';

class GraficasCircularesPage extends StatefulWidget {
  const GraficasCircularesPage({Key key}) : super(key: key);

  @override
  _GraficasCircularesPageState createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {
  double porcentaje = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomRadialWidget(
                porcentaje: porcentaje,
                colorPrimario: Colors.blue,
                colorSegundario: Colors.amber,
              ),
              CustomRadialWidget(
                porcentaje: porcentaje,
                colorPrimario: Colors.red,
                colorSegundario: Colors.green,
                grosorPrimario: 2,
                grosorSecundario: 20,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomRadialWidget(
                porcentaje: porcentaje,
                colorPrimario: Colors.cyanAccent,
                colorSegundario: Colors.pink,
                grosorPrimario: 5,
                grosorSecundario: 0,
              ),
              CustomRadialWidget(
                porcentaje: porcentaje,
                colorPrimario: Colors.purpleAccent,
                colorSegundario: Colors.white10,
                grosorPrimario: 40,
                grosorSecundario: 30,
              ),
            ],
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            porcentaje += 10;
            if (porcentaje > 100) {
              porcentaje = 0;
            }
          });
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}

class CustomRadialWidget extends StatelessWidget {
  const CustomRadialWidget({
    @required this.porcentaje,
    this.colorPrimario = Colors.blue,
    this.colorSegundario = Colors.grey,
    this.grosorPrimario = 10,
    this.grosorSecundario = 5,
  });

  final double porcentaje;
  final Color colorPrimario;
  final Color colorSegundario;
  final double grosorSecundario;
  final double grosorPrimario;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RadialProgress(
        porcentaje: porcentaje,
        colorPrimario: colorPrimario,
        colorSecundario: colorSegundario,
        grosorSecundario: grosorSecundario,
        grosorPrimario: grosorPrimario,
      ),
      width: 200,
      height: 200,
    );
  }
}
