import 'package:flutter/material.dart';

class CustomInputWidget extends StatelessWidget {
  IconData icon;
  TextInputType keyboardType;
  bool obscureText;
  TextEditingController textController;
  String placeholder;

  CustomInputWidget({
    this.icon,
    this.keyboardType,
    this.obscureText,
    this.textController,
    this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.only(top: 5, left: 5, bottom: 5, right: 20),
      child: TextField(
        controller: textController,
        autocorrect: false,
        keyboardType: this.keyboardType,
        obscureText: this.obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(this.icon),
          focusedBorder: InputBorder.none,
          border: InputBorder.none,
          hintText: this.placeholder,
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: Offset(0, 5),
            blurRadius: 5,
          ),
        ],
      ),
    );
  }
}
