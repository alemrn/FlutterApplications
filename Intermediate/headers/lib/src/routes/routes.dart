import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:headers/src/labs/slideshow_page.dart';
import 'package:headers/src/pages/animaciones_pages.dart';
import 'package:headers/src/pages/emergency_page.dart';
import 'package:headers/src/pages/graficcas_circulares_page.dart';
import 'package:headers/src/pages/headers_page.dart';
import 'package:headers/src/pages/pinterest_page.dart';

final pageRoutes = <_Route>[
  _Route(FontAwesomeIcons.heading, 'Header', HeadersPage()),
  _Route(FontAwesomeIcons.pinterest, 'Pinterest', PinterestPage()),
  _Route(FontAwesomeIcons.ambulance, 'emergency', EmergencyPage()),
  _Route(FontAwesomeIcons.slideshare, 'Slideshow', SlideShowPage()),
  _Route(FontAwesomeIcons.peopleCarry, 'Cuadro Animado', AnimacionesPage()),
  _Route(FontAwesomeIcons.circleNotch, 'Barra Progreso', GraficasCircularesPage()),
];

class _Route {
  final IconData icon;
  final String titulo;
  final Widget page;

  _Route(this.icon, this.titulo, this.page);
}
