import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  String route;
  bool account;

  Labels({this.route, this.account});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            (!account) ? '¿No tienes cuenta?' : '¿Ya tienes cuenta?',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 15,
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () => Navigator.pushReplacementNamed(context, this.route),
            child: Text(
              (!account) ? 'Create una ahora!' : 'Accede con tu cuenta',
              style: TextStyle(
                color: Colors.blue[600],
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
