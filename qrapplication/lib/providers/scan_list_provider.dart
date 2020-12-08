import 'package:flutter/material.dart';
import 'package:qrapplication/models/scan_model.dart';
import 'package:qrapplication/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String tipoSeleccionado = 'http';

  Future<ScanModel> newScan(String valor) async {
    final newScan = new ScanModel(valor: valor);
    final id = await DBProvider.db.nuevoScan(newScan);

    newScan.id = id;
    if (this.tipoSeleccionado == newScan.tipo) {
      this.scans.add(newScan);
      notifyListeners();
    }
    return newScan;
  }

  cargarScans() async {
    final scans = await DBProvider.db.getScans();

    this.scans = [...scans];
    notifyListeners();
  }

  cargarScansByType(String type) async {
    final scans = await DBProvider.db.getScansByType(type);
    this.scans = [...scans];
    this.tipoSeleccionado = type;
    notifyListeners();
  }

  deleteAll() async {
    await DBProvider.db.deleteAllScans();
    this.scans = [];
    notifyListeners();
  }

  deleteScansById(int id) async {
    await DBProvider.db.deleteScans(id);
    this.cargarScansByType(this.tipoSeleccionado);
  }
}
