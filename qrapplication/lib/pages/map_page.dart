import 'package:flutter/material.dart';
import 'package:qrapplication/Widgets/googlemap_widget.dart';
import 'package:qrapplication/models/scan_model.dart';

class MapaPage extends StatelessWidget {
  const MapaPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScanModel scan = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
      ),
      body: Center(
        child: GoogleMapWidget(),
      ),
    );
  }
}
