import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController email;
  final String hint;
  final bool obscureText;
  CustomTextField(this.email,this.hint,this.obscureText);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset:
              Offset(0, 3),
            ),
          ],
        ),
        child: TextField(
          obscureText: obscureText,
          controller: email,
          decoration: InputDecoration(
            labelText: hint,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            border: InputBorder.none,
          ),
        ));
  }
}