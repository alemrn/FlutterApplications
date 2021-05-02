import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zapatos/src/models/zapato_model.dart';
import 'package:zapatos/src/pages/zapato_desc_page.dart';

class ZapatoSizePreview extends StatelessWidget {
  final bool fullScreen;

  const ZapatoSizePreview({this.fullScreen = false});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: (fullScreen) ? 5 : 30,
          vertical: (fullScreen) ? 0 : 5,
        ),
        child: Container(
          width: double.infinity,
          height: 380,
          decoration: BoxDecoration(
            color: Color(0xffFFCF53),
            borderRadius: !fullScreen
                ? BorderRadius.circular(50)
                : BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
          ),
          child: Column(
            children: [
              _ZapatoConSombra(),
              fullScreen ? Container() : _ZapatoTallas(),
            ],
          ),
        ),
      ),
      onTap: () {
        if (!this.fullScreen) Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ZapatoDescPage()));
      },
    );
  }
}

class _ZapatoConSombra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final zapatoMode = Provider.of<ZapatoModel>(context);
    return Padding(
      padding: EdgeInsets.all(30),
      child: Stack(
        children: [
          Positioned(
            top: 120,
            right: 5,
            child: _ZapatoSombra(),
          ),
          Image(
            image: AssetImage(zapatoMode.assetImage),
          ),
        ],
      ),
    );
  }
}

class _ZapatoSombra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 200,
        height: 120,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
              color: Color(0xffEAA14E),
              blurRadius: 40,
            ),
          ],
        ),
      ),
    );
  }
}

class _ZapatoTallas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _TallaZapatoCaja(
            numero: 7,
          ),
          _TallaZapatoCaja(
            numero: 7.5,
          ),
          _TallaZapatoCaja(
            numero: 8,
          ),
          _TallaZapatoCaja(
            numero: 8.5,
          ),
          _TallaZapatoCaja(
            numero: 9,
          ),
          _TallaZapatoCaja(
            numero: 9.5,
          )
        ],
      ),
    );
  }
}

class _TallaZapatoCaja extends StatelessWidget {
  final double numero;
  const _TallaZapatoCaja({this.numero});

  @override
  Widget build(BuildContext context) {
    final zapatoModel = Provider.of<ZapatoModel>(context);
    return GestureDetector(
      onTap: () {
        zapatoModel.talla = numero;
      },
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: numero == zapatoModel.talla ? Color(0xffFFB100) : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: numero == zapatoModel.talla ? Color(0xffFFB100) : Colors.transparent,
              blurRadius: 10,
            )
          ],
        ),
        child: Text(
          '${numero.toString().replaceAll('.0', '')}',
          style: TextStyle(
            color: numero == zapatoModel.talla ? Colors.white : Color(0xffFE9F07),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        alignment: Alignment.center,
      ),
    );
  }
}
