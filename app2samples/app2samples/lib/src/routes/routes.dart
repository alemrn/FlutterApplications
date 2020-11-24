import 'package:app2samples/src/Pages/animated_contained.dart';
import 'package:app2samples/src/Pages/card_page.dart';
import 'package:app2samples/src/Pages/inpupt_page.dart';
import 'package:flutter/material.dart';

import 'package:app2samples/src/Pages/HomePage.dart';
import 'package:app2samples/src/Pages/alert_page.dart';
import 'package:app2samples/src/Pages/avatar_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    'home': (BuildContext context) => HomePage(),
    'alert': (BuildContext context) => AlertPage(),
    'avatar': (BuildContext context) => AvatarPage(),
    'card': (BuildContext context) => CardPage(),
    'animatedContainer': (BuildContext) => AnimatedContaierPage(),
    'inputs': (BuildContext) => InputPage(),
  };
}
