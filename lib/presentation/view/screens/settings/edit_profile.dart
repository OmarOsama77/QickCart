import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quirkcart/presentation/view/widgets/auth_widgets/custom_button.dart';
import 'package:quirkcart/presentation/view/widgets/auth_widgets/custom_text_field.dart';

import '../../../cubits/use_cubti/user_cubit.dart';

class EditProfile extends StatelessWidget {
  TextEditingController fName = TextEditingController();
  TextEditingController sName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController address = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<UserCubit>(context);
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      body:SafeArea(child:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30,left: 22,right: 22,bottom: 90),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Row(
                 children: [
                   IconButton(onPressed:(){
                     Navigator.pop(context);
                   }, icon: Icon(Icons.arrow_back_ios_new)),
                   Expanded(child: Align(
                       alignment: Alignment.center,
                       child: Text("Edit Profile",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),))),
                 ],
               ),
             SizedBox(height: 60,),
              Align(
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage:NetworkImage(cubit.userData!.profileImageURL.toString()),
                ),
              ),

              SizedBox(height: 40,),
              CustomTextField(fName, "Change first name"),
              SizedBox(height: 40,),
              CustomTextField(sName, "Change second name"),
              SizedBox(height: 40,),
              CustomTextField(address, "Change address"),
              SizedBox(height: 40,),
              CustomTextField(password, "Change password"),
              SizedBox(height: 40,),
              CustomButton("Save", () {
               if(fName.text!=cubit.userData!.fName){
                 cubit.userData!.fName=fName.text;
                 print('fname changed');
              }
               if(sName.text!=cubit.userData!.sName){
                 cubit.userData!.sName=sName.text;
                 print('sname changed');
               }
               if(address.text!=cubit.userData!.address){
                 print('address changed');
                 cubit.userData!.address=address.text;
               }
              })
            ],
          ),
        ),
      ))
    );
  }
}

