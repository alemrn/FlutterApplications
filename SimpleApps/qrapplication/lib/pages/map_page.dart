import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:qrapplication/Widgets/googlemap_widget.dart';
import 'package:qrapplication/models/scan_model.dart';

class MapaPage extends StatefulWidget {
  const MapaPage({Key key}) : super(key: key);

  @override
  _MapaPageState createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  Completer<GoogleMapController> _controller = Completer();
  MapType maptype = MapType.normal;
  @override
  Widget build(BuildContext context) {
    final ScanModel scan = ModalRoute.of(context).settings.arguments;

    print(scan.valor);

    final CameraPosition _kGooglePlex = CameraPosition(
      target: scan.getLatLng(),
      zoom: 17,
    );

    //marcadores
    Set<Marker> markers = new Set<Marker>();
    markers.add(new Marker(
      markerId: MarkerId(scan.valor),
      position: scan.getLatLng(),
    ));

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Map'),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.location_searching),
            onPressed: () async {
              final GoogleMapController controller = await _controller.future;
              controller.animateCamera(
                  CameraUpdate.newCameraPosition(new CameraPosition(
                target: scan.getLatLng(),
                tilt: 60,
                zoom: 20,
              )));
            },
          )
        ],
      ),
      body: GoogleMap(
        mapType: maptype,
        markers: markers,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (maptype == MapType.normal) {
            maptype = MapType.satellite;
          } else {
            maptype = MapType.normal;
          }
          setState(() {});
        },
        child: Icon(Icons.layers),
      ),
    );
  }
}
