import 'package:flutter/material.dart';
import 'package:headers/src/models/layout_model.dart';
import 'package:headers/src/pages/launcher_page.dart';
import 'package:headers/src/pages/launcher_table_page.dart';
import 'package:headers/src/theme/themechanger.dart';
import 'package:provider/provider.dart';

// void main() {
//   runApp(
//     ChangeNotifierProvider(
//       create: (_) => new ThemeChanger(1),
//       child: MyApp(),
//     ),
//   );
// }
//
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeChanger>(
          create: (_) => new ThemeChanger(1),
        ),
        ChangeNotifierProvider<LayoutModel>(
          create: (_) => new LayoutModel(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return MaterialApp(
      title: 'Diseños',
      theme: currentTheme,
      home: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          //print('Orientation $orientation');

          final screenSize = MediaQuery.of(context).size;

          if (screenSize.width > 500) {
            return LauncherTabletPage();
          } else {
            return LauncherPage();
          }

          // return Container(
          //   child: LauncherPage(),
          // );
        },
      ),
    );
  }
}
