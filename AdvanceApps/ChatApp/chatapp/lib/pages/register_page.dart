import 'package:chatapp/Widgets/btn_azul.dart';
import 'package:chatapp/Widgets/custom_input.dart';
import 'package:chatapp/Widgets/label_widget.dart';
import 'package:chatapp/Widgets/logo_widget.dart';
import 'package:chatapp/routes/routes.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Logo(titulo: 'Registro'),
                _Form(),
                Labels(route: Routes.loginRoutes, account: true),
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
  final nameCtrl = TextEditingController();
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
            placeholder: 'Name',
            icon: Icons.perm_identity,
            keyboardType: TextInputType.text,
            textController: nameCtrl,
          ),
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
            title: 'Registrar',
            onpress: () {
              print('valores');
            },
          ),
        ],
      ),
    );
  }
}
