import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final Function onPressed;
  final IconData icon;

  PinterestButton({@required this.onPressed, @required this.icon});
}

class PinterestMenu extends StatelessWidget {
  final bool mostrar;
  PinterestMenu({this.mostrar = true});
  final List<PinterestButton> items = [
    PinterestButton(
        icon: Icons.pie_chart,
        onPressed: () {
          print('Icon pie chart');
        }),
    PinterestButton(
        icon: Icons.search,
        onPressed: () {
          print('Icon search');
        }),
    PinterestButton(
        icon: Icons.notifications,
        onPressed: () {
          print('Icon notifications');
        }),
    PinterestButton(
        icon: Icons.supervised_user_circle,
        onPressed: () {
          print('Icon supervised_user_circle');
        }),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => new _MenuModel(),
      child: AnimatedOpacity(
        opacity: (mostrar) ? 1 : 0,
        duration: Duration(milliseconds: 250),
        child: PinterestMenuBackground(
          child: _MenuItems(menuItems: items),
        ),
      ),
    );
  }
}

class PinterestMenuBackground extends StatelessWidget {
  final Widget child;
  const PinterestMenuBackground({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: this.child,
      width: 250,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(100),
        ),
        boxShadow: [
          BoxShadow(color: Colors.black38, offset: Offset(10.0, 10.0), blurRadius: 20, spreadRadius: -5),
        ],
      ),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> menuItems;

  const _MenuItems({this.menuItems});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        menuItems.length,
        (i) => _PinterestMenuButton(i, menuItems[i]),
      ),
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton item;

  _PinterestMenuButton(this.index, this.item);

  @override
  Widget build(BuildContext context) {
    int itemselected = Provider.of<_MenuModel>(context).itemSelected;
    return GestureDetector(
        behavior: HitTestBehavior.translucent,
        child: Container(
          child: Icon(
            item.icon,
            size: itemselected == index ? 30 : 25,
            color: itemselected == index ? Colors.red : Colors.blueGrey,
          ),
        ),
        onTap: () {
          Provider.of<_MenuModel>(context, listen: false).itemSelected = index;
          item.onPressed();
        });
  }
}

class _MenuModel with ChangeNotifier {
  int _itemSeleccionado = 0;

  get itemSelected => this._itemSeleccionado;
  set itemSelected(int value) {
    this._itemSeleccionado = value;
    notifyListeners();
  }
}
