import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quirkcart/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:quirkcart/presentation/cubits/use_cubti/user_cubit.dart';
import 'package:quirkcart/presentation/view/widgets/auth_widgets/custom_button.dart';
import 'package:quirkcart/presentation/view/widgets/auth_widgets/custom_text_field.dart';
import 'package:quirkcart/utils/routes/routes_names.dart';
class Login extends StatelessWidget {

TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AuthCubit>(context);
    final cubit2 = BlocProvider.of<UserCubit>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                    }, child:const Text('Create an account',style: TextStyle(color: Colors.black),))),
                SizedBox(height: 10,),

                 CustomButton("Login", ()async {
                  UserCredential? userCredntial= await cubit.login(email.text, password.text);
                  print('login = ${userCredntial!.user!.uid}');
                  String uId = userCredntial!.user!.uid;
                  if(uId!=null){
                     cubit2.setUserId = uId;
                     cubit2.setUEmail = userCredntial!.user!.email.toString();
                     Navigator.pushReplacementNamed(context, RouteNames.splash);
                   }
                 })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

