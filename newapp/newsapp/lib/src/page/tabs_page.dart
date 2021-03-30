import 'package:flutter/material.dart';
import 'package:newsapp/src/page/tab1_page.dart';
import 'package:newsapp/src/page/tab2_page.dart';
import 'package:newsapp/src/services/news_service.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return new _NavegacionModel();
      },
      child: Scaffold(
        body: _Pages(),
        bottomNavigationBar: _Navigation(),
      ),
    );
  }
}

class _Navigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);
    return BottomNavigationBar(
      onTap: (i) => navegacionModel.paginaactual = i,
      currentIndex: navegacionModel.paginaactual,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outline), label: 'Para ti'),
        BottomNavigationBarItem(icon: Icon(Icons.public), label: 'encabezado'),
      ],
    );
  }
}

class _Pages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return PageView(
      controller: navegacionModel.controller,
      physics: NeverScrollableScrollPhysics(),
      children: [Tab1Page(), Tab2Page()],
    );
  }
}

class _NavegacionModel with ChangeNotifier {
  int _paginaActual = 0;
  PageController _pageController = new PageController();

  int get paginaactual => this._paginaActual;
  set paginaactual(int pagina) {
    this._paginaActual = pagina;
    _pageController.animateToPage(pagina,
        duration: Duration(milliseconds: 500), curve: Curves.bounceInOut);
    notifyListeners();
  }

  PageController get controller => this._pageController;
}
