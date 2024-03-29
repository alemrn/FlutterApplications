import 'package:flutter/material.dart';
import 'package:zapatos/src/widgets/custom_widgets.dart';

class AgregarCarritoBoton extends StatelessWidget {
  final double cantidad;

  const AgregarCarritoBoton({this.cantidad});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.15),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Text(
              '\$$cantidad',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            BotonNaranja(texto: 'Add to cart'),
            SizedBox(
              width: 20,
            )
          ],
        ),
      ),
    );
  }
}
