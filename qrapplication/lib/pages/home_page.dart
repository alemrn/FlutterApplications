import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrapplication/Widgets/custom_navigatorbar.dart';
import 'package:qrapplication/Widgets/scan_button.dart';
import 'package:qrapplication/pages/directions_pages.dart';
import 'package:qrapplication/pages/maps_pages.dart';
import 'package:qrapplication/providers/db_provider.dart';
import 'package:qrapplication/providers/scan_list_provider.dart';
import 'package:qrapplication/providers/ui_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () {
              final scanListProvider =
                  Provider.of<ScanListProvider>(context, listen: false);
              scanListProvider.deleteAll();
            },
          ),
        ],
      ),
      body: _HomePagebody(),
      bottomNavigationBar: CustomNavigatorBar(),
      floatingActionButton: Scanbutton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePagebody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Obtener el selected menu opt
    final uiProvider = Provider.of<UiProvider>(context);

    //Cambiar para mostrar la pagina respectiva

    final currentIndex = uiProvider.selectedMenuOpt;

    // TODO Temporal leer la base de datos
    // final tempScan = new ScanModel(valor: 'http://google.com');
    // DBProvider.db.nuevoScan(tempScan);
    // DBProvider.db.getScans().then((value) => print(value));
    // Usar el scanlistprovider

    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);

    switch (currentIndex) {
      case 0:
        scanListProvider.cargarScansByType('geo');
        return MapsPage();
        break;
      case 1:
        scanListProvider.cargarScansByType('http');
        return DirectionsPage();
        break;
      default:
        return MapsPage();
    }
  }
}
