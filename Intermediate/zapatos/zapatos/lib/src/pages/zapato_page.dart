import 'package:flutter/material.dart';
import 'package:zapatos/src/helpers/helpers.dart';
import 'package:zapatos/src/widgets/custom_widgets.dart';

class ZapatoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    cambiarStatusDark();
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(texto: 'For You'),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Hero(
                    tag: 'Zapato-1',
                    child: ZapatoSizePreview(),
                  ),
                  ZapatoDescripcion(
                    title: 'Nike Air Max 720',
                    descripcion:
                        "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                  )
                ],
              ),
            ),
          ),
          AgregarCarritoBoton(cantidad: 100.0)
        ],
      ),
    );
  }
}
