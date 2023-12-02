import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quirkcart/models/cart.dart';
import 'package:quirkcart/presentation/cubits/use_cubti/user_cubit.dart';
import 'package:quirkcart/presentation/view/widgets/auth_widgets/custom_button.dart';
import 'package:quirkcart/presentation/view/widgets/widh_list_widgets/address_card.dart';
import 'package:quirkcart/utils/routes/routes_names.dart';

import '../../../cubits/cart_cubit/cart_cubit.dart';
class CheckOut extends StatelessWidget {
  num? price;


  CheckOut(this.price);

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<UserCubit>(context);
    var cubit2 = BlocProvider.of<CartCubit>(context);
    num summary = price!+15;
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,
      leading: IconButton(onPressed:(){
        Navigator.pop(context);
      }, icon:const Icon(Icons.arrow_back_ios_new,color: Colors.black,)),
      centerTitle: true,
        title:const Text("CheckOut",style: TextStyle(fontSize: 20,color: Colors.black),),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 22,left: 15,right: 15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Shipping address",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
            const  SizedBox(height: 50,),
            AddressCard("${cubit.userData!.fName} ${cubit.userData!.sName}"),
           const SizedBox(height: 40,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const   Text("Order",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                Text("$price\$",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)
              ],
            ),
            SizedBox(height: 40,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const    Text("Delivery",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                const  Text("15\$",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)
              ],
            ),
            SizedBox(height: 40,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const  Text("Summary",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                Text("$summary\$",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)
              ],
            ),
            const  SizedBox(height: 110,),
            CustomButton("Submit Order", ()async{
             await cubit2.uploadOrderedCart(cubit.userData!.uId!);
              cubit2.resetCart();
              cubit2.resetCartFromDB(cubit.userData!.uId!);
              Navigator.pushReplacementNamed(context, RouteNames.successOrder);
            })
          ],
        ),
      ),
    );
  }
}
