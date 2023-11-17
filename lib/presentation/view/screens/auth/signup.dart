import 'package:flutter/material.dart';
import 'package:quirkcart/presentation/view/widgets/auth_widgets/custom_button.dart';
import 'package:quirkcart/presentation/view/widgets/auth_widgets/custom_text_field.dart';

class Signup extends StatelessWidget {
  TextEditingController fName = TextEditingController();
  TextEditingController sName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController confirmPass = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController height = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 22,top: 25,right: 22),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(onPressed:(){
                      Navigator.pop(context);
                    }, icon: Icon(Icons.arrow_back_ios_new,size: 22,))),
                SizedBox(height: 22,),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text("Register",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),)),
                ),
                SizedBox(height: 50,),
                CustomTextField(fName, "First Name"),
                SizedBox(height: 20,),
                CustomTextField(sName, "Second Name"),
                SizedBox(height: 20,),
                CustomTextField(email, "Email ID"),
                SizedBox(height: 20,),
                CustomTextField(pass, "Password"),
                SizedBox(height: 20,),
                CustomTextField(confirmPass, "Confirm Password"),
                SizedBox(height: 20,),
                CustomTextField(age, "Age"),
                SizedBox(height: 20,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: 150,
                        height: 62,
                        child: CustomTextField(height, "Height")),
                    Container(
                        width: 150,
                        height: 62,
                        child: CustomTextField(weight, "weight")),
                  ],
                ),
                SizedBox(height: 50,),
                CustomButton("Register", () {
                  print("register clicked");
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
