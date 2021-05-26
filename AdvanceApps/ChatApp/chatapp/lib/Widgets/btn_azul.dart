import 'package:flutter/material.dart';

class BtnAzulWidget extends StatelessWidget {
  final Function onpress;
  final String title;

  BtnAzulWidget({
    this.title,
    this.onpress,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 2,
      highlightElevation: 5,
      color: Colors.blue,
      shape: StadiumBorder(),
      onPressed: this.onpress,
      child: Container(
        width: double.infinity,
        height: 55,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
