import 'package:application_preferences/src/widget/Menu_widget.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  static final String routeName = 'Settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      drawer: MenuWidget(),
      body: Center(
        child: Text('Settings page'),
      ),
    );
  }
}
