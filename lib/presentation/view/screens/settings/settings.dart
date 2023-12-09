import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quirkcart/presentation/cubits/use_cubti/user_cubit.dart';
import 'package:quirkcart/utils/routes/app_router.dart';
import 'package:quirkcart/utils/routes/routes_names.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<UserCubit>(context);

    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.only(top: 90,left: 22,right: 22),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text("My Profile ",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(cubit.userData!.profileImageURL.toString()),
              ),
                SizedBox(width: 18,),
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${cubit.userData!.fName} ${cubit.userData!.sName}",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                  SizedBox(height: 4,),
                  Text(cubit.userData!.email),
                ],
              )
            ],
          ),
          SizedBox(height: 40,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Edit Profile",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
              IconButton(onPressed:(){
                Navigator.pushNamed(context, RouteNames.editProfile);
              }, icon: Icon(Icons.arrow_forward_ios_outlined)),
            ],
          ),
          SizedBox(height: 40,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("My Orders",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
              IconButton(onPressed:(){}, icon: Icon(Icons.arrow_forward_ios_outlined)),
            ],
          ),
          SizedBox(height: 40,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("LogOut",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
              IconButton(onPressed:(){}, icon: Icon(Icons.logout)),
            ],
          ),
          SizedBox(height: 40,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Delete account",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
              IconButton(onPressed:(){}, icon: Icon(Icons.delete)),
            ],
          ),
        ],
      ),
    )));
  }
}
