import 'package:flutter/material.dart';
import 'package:newsapp/src/page/tabs_page.dart';
import 'package:newsapp/src/services/news_service.dart';
import 'package:newsapp/src/theme/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new NewsService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: theme,
        home: TabsPage(),
      ),
    );
  }
}
