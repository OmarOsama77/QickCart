import 'package:flutter/material.dart';
import 'package:quirkcart/presentation/view/widgets/auth_widgets/custom_button.dart';
import 'package:quirkcart/presentation/view/widgets/auth_widgets/custom_text_field.dart';
import 'package:quirkcart/utils/routes/routes_names.dart';
class Login extends StatelessWidget {

TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 22,top: 100,right: 22),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Text("Login",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),)),
              SizedBox(height: 100,),
              CustomTextField(email,"Email ID"),
              SizedBox(height: 20,),
              CustomTextField(password,"Password"),
              Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(onPressed:(){
                   Navigator.pushNamed(context, RouteNames.signup);
                  }, child: Text('Already have an account?',style: TextStyle(color: Colors.black),))),
              SizedBox(height: 10,),

               CustomButton("Login", () {
                 Navigator.pushReplacementNamed(context, RouteNames.bottomNavBar);
               })
            ],
          ),
        ),
      ),
    );
  }
}

