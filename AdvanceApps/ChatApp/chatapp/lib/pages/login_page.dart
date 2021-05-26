import 'package:chatapp/Widgets/btn_azul.dart';
import 'package:chatapp/Widgets/custom_input.dart';
import 'package:chatapp/Widgets/label_widget.dart';
import 'package:chatapp/Widgets/logo_widget.dart';
import 'package:chatapp/routes/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Logo(titulo: 'Messenger'),
                _Form(),
                Labels(route: Routes.registerRoutes, account: false),
                Text(
                  'Terminos y condiciones de uso',
                  style: TextStyle(fontWeight: FontWeight.w200),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomInputWidget(
            obscureText: false,
            placeholder: 'Email',
            icon: Icons.mail_outline,
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),
          CustomInputWidget(
            obscureText: true,
            placeholder: 'Password',
            icon: Icons.lock,
            keyboardType: TextInputType.text,
            textController: passCtrl,
          ),
          // TODO: crear boton
          BtnAzulWidget(
            title: 'Ingrese',
            onpress: () {
              print('valores');
            },
          ),
        ],
      ),
    );
  }
}
