import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qrapplication/providers/scan_list_provider.dart';
import 'package:qrapplication/utils/utils.dart';

class Scanbutton extends StatelessWidget {
  const Scanbutton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: Icon(Icons.filter_center_focus),
      onPressed: () async {
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            "#3D8BEF", 'Cancelar', false, ScanMode.QR);
        if (barcodeScanRes != -1) {
          print(barcodeScanRes);
          final scanListProvider =
              Provider.of<ScanListProvider>(context, listen: false);

          final newScan = await scanListProvider.newScan(barcodeScanRes);

          launchURL(context, newScan);
        }
      },
    );
  }
}
