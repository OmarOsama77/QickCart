import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 50,left: 22,right: 22),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Settings",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Text("Personal information",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              SizedBox(height: 40,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Change First Name",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                  IconButton(onPressed:(){}, icon: Icon(Icons.arrow_forward_ios_outlined))
                ],
              ),
              SizedBox(height: 20,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Change Second Name",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                  IconButton(onPressed:(){}, icon: Icon(Icons.arrow_forward_ios_outlined))
                ],
              ),
              SizedBox(height: 20,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("LogOut",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                  IconButton(onPressed:(){}, icon: Icon(Icons.logout))
                ],
              ),
              SizedBox(height: 20,),




            ],
          ),
        ),
      ),
    );
  }
}
