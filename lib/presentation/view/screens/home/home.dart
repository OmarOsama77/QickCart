import 'package:flutter/material.dart';
import 'package:quirkcart/presentation/view/widgets/home_widgets/item_card.dart';
import 'package:quirkcart/presentation/view/widgets/home_widgets/photo_carouse.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 22,left: 10),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("Welcome Omar",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)
                  ],
                ),
                  SizedBox(height: 20,),
                  PhotoCarousel(),
                SizedBox(height: 30,),
                Text("New",style: TextStyle(fontSize: 42,fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                ItemCart(),
              ],
            ),
          ),
        ),
      )
    );
  }
}
