import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quirkcart/data/repositry/use_repository_impl/user_repo_impl.dart';
import 'package:quirkcart/domain/usecases/user_use_cases/login_use_case/login_use_case.dart';
import 'package:quirkcart/domain/usecases/user_use_cases/login_use_case/signup_use_case.dart';
import 'package:quirkcart/models/users.dart';
import 'package:quirkcart/presentation/cubits/auth_cubit/auth_cubit.dart';
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
    final cubit = BlocProvider.of<AuthCubit>(context);
    String selectedGender ="";
    var items =["Male","Female"];
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 22, top: 25, right: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new,
                          size: 22,
                        ))),
                SizedBox(
                  height: 22,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Register",
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      )),
                ),
                SizedBox(
                  height: 50,
                ),
                CustomTextField(fName, "First Name"),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(sName, "Second Name"),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(email, "Email ID"),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(pass, "Password"),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(confirmPass, "Confirm Password"),
                SizedBox(
                  height: 20,
                ),
               Row(
                 children: [
                   Container(
                       width: 150,
                       height: 62,
                       child: CustomTextField(age, "Age")),
                      SizedBox(width: 22,),
                      Expanded(
                        child:
                       BlocBuilder<AuthCubit,AuthState>(builder:(context,state){
                         return  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                           children: [
                             Column(
                               children: [
                                 Text("Male"),
                                 IconButton(onPressed:(){
                                   cubit.chooseMale();
                                 }, icon:cubit.male?Icon(Icons.check_box):Icon(Icons.check_box_outline_blank_outlined)),
                               ],
                             ),
                             Column(
                               children: [
                                 Text("FeMale"),
                                 IconButton(onPressed:(){
                                   cubit.chooseFemale();
                                 }, icon: cubit.female?Icon(Icons.check_box):Icon(Icons.check_box_outline_blank_outlined)),
                               ],
                             )
                           ],
                         );
                       })
                      )
                 ],
               ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                SizedBox(
                  height: 50,
                ),
           BlocBuilder<AuthCubit,AuthState>(builder:(context,state){
             print('state = $state');
                  return ElevatedButton(
                 onPressed:(){
                  Users user = Users(fName: fName.text, sName: sName.text, email: email.text, age: age.text, height: height.text, weight: weight.text, gender: cubit.gender!);
                   cubit.signUp(
                       email.text,
                       pass.text,
                       fName.text,
                       sName.text,
                       pass.text,
                       confirmPass.text,
                       age.text,
                       height.text,
                       weight.text,
                        user
                   );
                 },
                 child:cubit.loading  ?
                     CircularProgressIndicator(color: Color(0xFFDB3022) ,)
                     :Text("Register"),
                 style: ElevatedButton.styleFrom(
                     fixedSize: Size(2000, 50),
                     primary: Color(0xFFDB3022),
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(12),
                     )));
           })
              ],
            ),
          ),
        ),
      ),
    );
  }
}


