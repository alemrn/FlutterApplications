import 'package:flutter/material.dart';
import 'package:qrapplication/Widgets/custom_navigatorbar.dart';
import 'package:qrapplication/Widgets/scan_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          IconButton(icon: Icon(Icons.delete_forever), onPressed: () {})
        ],
      ),
      body: Center(
        child: Text('HomePage'),
      ),
      bottomNavigationBar: CustomNavigatorBar(),
      floatingActionButton: Scanbutton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
