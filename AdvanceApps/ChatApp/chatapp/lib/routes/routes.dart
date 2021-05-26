import 'package:chatapp/pages/chat_page.dart';
import 'package:chatapp/pages/loading_page.dart';
import 'package:chatapp/pages/login_page.dart';
import 'package:chatapp/pages/register_page.dart';
import 'package:chatapp/pages/usuarios_page.dart';
import 'package:flutter/cupertino.dart';

class Routes {
  static final String usuariosRoutes = '/usuarios';
  static final String loadingRoutes = '/loading';
  static final String registerRoutes = '/register';
  static final String loginRoutes = '/login';
  static final String chatRoutes = '/chat';
}

final Map<String, Widget Function(BuildContext)> appRoutes = {
  Routes.usuariosRoutes: (_) => UsuariosPage(),
  Routes.loadingRoutes: (_) => LoadingPage(),
  Routes.registerRoutes: (_) => RegisterPage(),
  Routes.loginRoutes: (_) => LoginPage(),
  Routes.chatRoutes: (_) => ChatPage(),
};
