import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zapatos/src/helpers/helpers.dart';
import 'package:zapatos/src/models/zapato_model.dart';
import 'package:zapatos/src/widgets/custom_widgets.dart';

class ZapatoDescPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    cambiarStatusLight();
    return Scaffold(
        body: Column(
      children: [
        Stack(
          children: [
            Hero(tag: 'Zapato-1', child: ZapatoSizePreview(fullScreen: true)),
            Positioned(
              top: 80,
              child: FloatingActionButton(
                child: Icon(
                  Icons.chevron_left,
                  size: 60,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                elevation: 0,
                highlightElevation: 0,
                backgroundColor: Colors.transparent,
                splashColor: Colors.transparent,
              ),
            ),
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                ZapatoDescripcion(
                  title: 'Nike Air Max 720',
                  descripcion:
                      "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                ),
                _MontoBuyNow(),
                _ColoresYmas(),
                _BotonesLikeCartSettings(),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}

class _BotonesLikeCartSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _BotonSombreado(Icon(Icons.star, color: Colors.red)),
          _BotonSombreado(Icon(Icons.add_shopping_cart, color: Colors.grey.withOpacity(0.1))),
          _BotonSombreado(Icon(Icons.settings, color: Colors.grey.withOpacity(0.1))),
        ],
      ),
    );
  }
}

class _BotonSombreado extends StatelessWidget {
  final Icon icon;

  const _BotonSombreado(this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: this.icon,
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            spreadRadius: -5,
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
    );
  }
}

class _ColoresYmas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  left: 60,
                  child: _BotonColor(Color(0xffc6d642), 1),
                ),
                Positioned(
                  left: 40,
                  child: _BotonColor(Color(0xffffad29), 2),
                ),
                Positioned(
                  left: 20,
                  child: _BotonColor(Color(0xff2099f1), 3),
                ),
                _BotonColor(Color(0xff364d56), 4),
              ],
            ),
          ),
          BotonNaranja(
            texto: 'More related item',
            alto: 30,
            ancho: 130,
            color: Colors.orange[100],
          ),
        ],
      ),
    );
  }
}

class _BotonColor extends StatelessWidget {
  final Color color;
  final int index;

  const _BotonColor(this.color, this.index);

  @override
  Widget build(BuildContext context) {
    final zapatoModel = Provider.of<ZapatoModel>(context);
    return FadeInLeft(
      delay: Duration(milliseconds: index * 100),
      child: GestureDetector(
        onTap: () {
          switch (index) {
            case 1:
              zapatoModel.assetImage = 'assets/imgs/verde.png';
              break;
            case 2:
              zapatoModel.assetImage = 'assets/imgs/amarillo.png';
              break;
            case 3:
              zapatoModel.assetImage = 'assets/imgs/azul.png';
              break;
            case 4:
              zapatoModel.assetImage = 'assets/imgs/negro.png';
              break;
            default:
          }
        },
        child: Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

class _MontoBuyNow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
        margin: EdgeInsets.only(
          top: 15,
          bottom: 20,
        ),
        child: Row(
          children: [
            Text(
              '\$180.0',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Bounce(
              from: 8,
              child: BotonNaranja(
                texto: 'Buy now',
                ancho: 100,
                alto: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
