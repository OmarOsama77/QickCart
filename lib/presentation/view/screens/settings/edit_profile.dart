import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quirkcart/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:quirkcart/presentation/cubits/settings_cubit/settings_cubit.dart';
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
    var cubit2 = BlocProvider.of<SettingsCubit>(context);
    var cubit3 = BlocProvider.of<AuthCubit>(context);
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
                    }, icon: const Icon(Icons.arrow_back_ios_new)),
                    const Expanded(child: Align(
                        alignment: Alignment.center,
                        child: Text("Edit Profile",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),))),
                  ],
                ),
                const SizedBox(height: 60,),
                Align(
                  alignment: Alignment.center,
                  child:
                  BlocBuilder<SettingsCubit, SettingsState>(
                    builder: (context, state) {
                      return GestureDetector(
                        onTap: (){
                          cubit2.pickProfileImage();
                          if (cubit2.profileImage != null) {
                            cubit.userData!.profileImageURL = cubit2.profileImage.toString();
                          }
                        },
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: cubit2.profileImage != null
                              ? FileImage(cubit2.profileImage!) as ImageProvider
                              : NetworkImage(cubit.userData!.profileImageURL.toString()),
                        ),
                      );
                    },
                  ),

                ),

                const SizedBox(height: 40,),
                CustomTextField(fName, "Change first name"),
                const SizedBox(height: 40,),
                CustomTextField(sName, "Change second name"),
                const SizedBox(height: 40,),
                CustomTextField(address, "Change address"),
                const SizedBox(height: 40,),
                CustomTextField(password, "Change password"),
                const SizedBox(height: 40,),
                CustomButton("Save", ()async{
                  if(fName.text!=cubit.userData!.fName&&fName.text.length>3){
                    cubit.userData!.fName=fName.text;
                    print('fname changed');
                  }
                  if(sName.text!=cubit.userData!.sName&&sName.text.length>3){
                    cubit.userData!.sName=sName.text;
                    print('sname changed');
                  }
                  if(address.text!=cubit.userData!.address&&address.text.length>3){
                    print('address changed');
                    cubit.userData!.address=address.text;
                  }
                  cubit2.updateUserData(cubit.userData!.uId.toString(), fName.text, sName.text, address.text);
                  await cubit3.uploadUserImage(cubit2.profileImage!, cubit.userData!.email);
                String userImage=  await cubit2.updateUserImage(cubit2.profileImage!, cubit.userData!.email);
                  cubit.userData!.profileImageURL = null;
                cubit.userData!.profileImageURL = userImage;
                })
              ],
            ),
          ),
        ))
    );
  }
}