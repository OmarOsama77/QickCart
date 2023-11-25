import 'package:flutter/material.dart';
import 'package:quirkcart/presentation/view/widgets/auth_widgets/custom_button.dart';
import 'package:quirkcart/presentation/view/widgets/cart_widgets/cart_item.dart';
import 'package:quirkcart/presentation/view/widgets/widh_list_widgets/wish_list_item.dart';
import 'package:quirkcart/utils/routes/routes_names.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SafeArea(
       child: SingleChildScrollView(
         child: Padding(
           padding: const EdgeInsets.only(top: 50,left: 20,right: 20),
           child: Column(crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text("My Bag",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
             ListView.builder(
               physics: const NeverScrollableScrollPhysics(),
               shrinkWrap: true,
                 itemCount: 0,
                 itemBuilder:(context,index){
               return  CartItem();
             }),
               SizedBox(height: 15,),

               Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                Text("Total Price",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                   Text("124\$",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)
                 ],
               ),
               SizedBox(height: 10,),
               CustomButton("CheckOut", () {
                    Navigator.pushNamed(context, RouteNames.checkOut);
               })
             ],
           ),
         ),
       ),
     ),
    );
  }
}
