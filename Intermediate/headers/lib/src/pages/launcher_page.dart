import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:headers/src/routes/routes.dart';
import 'package:headers/src/theme/themechanger.dart';
import 'package:provider/provider.dart';

class LauncherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return Scaffold(
      drawer: _MenuPrincipal(),
      appBar: AppBar(
        backgroundColor: appTheme.accentColor,
        title: Text('Diseños en Flutter - Telefono'),
      ),
      body: _ListaOpciones(),
    );
  }
}

class _ListaOpciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, i) => Divider(
        color: Colors.blue,
      ),
      itemCount: pageRoutes.length,
      itemBuilder: (context, i) => ListTile(
        leading: FaIcon(
          pageRoutes[i].icon,
          color: Colors.blue,
        ),
        title: Text(pageRoutes[i].titulo),
        trailing: Icon(
          Icons.chevron_right,
          color: Colors.blue,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => pageRoutes[i].page,
            ),
          );
        },
      ),
    );
  }
}

class _MenuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final apptheme = Provider.of<ThemeChanger>(context);

    return Drawer(
      child: Container(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                width: double.infinity,
                height: 200,
                child: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text(
                    'AME',
                    style: TextStyle(fontSize: 50),
                  ),
                ),
              ),
            ),
            Expanded(
              child: _ListaOpciones(),
            ),
            ListTile(
              leading: Icon(
                Icons.lightbulb_outline,
                color: Colors.blue,
              ),
              title: Text('DarkMode'),
              trailing: Switch.adaptive(
                value: apptheme.darkTheme,
                activeColor: Colors.blue,
                onChanged: (value) {
                  apptheme.darkTheme = value;
                },
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.add_to_home_screen,
                color: Colors.blue,
              ),
              title: Text('Custom theme'),
              trailing: Switch.adaptive(
                value: apptheme.customTheme,
                activeColor: Colors.blue,
                onChanged: (value) {
                  apptheme.customTheme = value;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
