import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrapplication/Widgets/scan_tiles.dart';
import 'package:qrapplication/providers/scan_list_provider.dart';

class MapsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScanTiles(tipo: 'geo');
  }
}
