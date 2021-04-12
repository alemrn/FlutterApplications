import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:headers/src/widget/boton_gordo.dart';
import 'package:headers/src/widget/headers.dart';

class EmergencyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 200),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                SizedBox(
                  height: 80,
                ),
                BotonGordo(
                  icon: FontAwesomeIcons.carCrash,
                  titulo: 'Motor Accident',
                  color1: Color(0xff6989F5),
                  color2: Color(0xff906EF5),
                  onpress: () {
                    print('Motor crash');
                  },
                ),
                BotonGordo(
                  icon: FontAwesomeIcons.carCrash,
                  titulo: 'Motor Accident',
                  color1: Color(0xff6989F5),
                  color2: Color(0xff906EF5),
                  onpress: () {
                    print('Motor crash');
                  },
                ),
                BotonGordo(
                  icon: FontAwesomeIcons.carCrash,
                  titulo: 'Motor Accident',
                  color1: Color(0xff6989F5),
                  color2: Color(0xff906EF5),
                  onpress: () {
                    print('Motor crash');
                  },
                ),
                BotonGordo(
                  icon: FontAwesomeIcons.carCrash,
                  titulo: 'Motor Accident',
                  color1: Color(0xff6989F5),
                  color2: Color(0xff906EF5),
                  onpress: () {
                    print('Motor crash');
                  },
                ),
                BotonGordo(
                  icon: FontAwesomeIcons.carCrash,
                  titulo: 'Motor Accident',
                  color1: Color(0xff6989F5),
                  color2: Color(0xff906EF5),
                  onpress: () {
                    print('Motor crash');
                  },
                ),
              ],
            ),
          ),
          PageHeader(),
        ],
      ),
    );
  }
}

class PageHeader extends StatelessWidget {
  const PageHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconHeader(
      icon: FontAwesomeIcons.plus,
      subtitle: 'Asistencia médica',
      titulo: 'Has solicitado',
      color1: Color(0xff526BF6),
      color2: Color(0xff67ACF2),
    );
  }
}
