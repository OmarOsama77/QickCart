import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

final String text;
final VoidCallback onPressed;
CustomButton(this.text,this.onPressed);

  @override
  Widget build(BuildContext context) {

    return ElevatedButton(
        onPressed:(){
          onPressed();
        },
        child: Text(text),
        style: ElevatedButton.styleFrom(
            fixedSize: Size(2000, 50),
            primary: Color(0xFFDB3022),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            )));
  }
}
