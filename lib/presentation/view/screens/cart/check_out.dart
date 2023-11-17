import 'package:flutter/material.dart';
import 'package:quirkcart/presentation/view/widgets/auth_widgets/custom_button.dart';
import 'package:quirkcart/presentation/view/widgets/widh_list_widgets/address_card.dart';
import 'package:quirkcart/utils/routes/routes_names.dart';
class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,
      leading: IconButton(onPressed:(){}, icon: Icon(Icons.arrow_back_ios_new,color: Colors.black,)),
      centerTitle: true,
        title: Text("CheckOut",style: TextStyle(fontSize: 20,color: Colors.black),),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 22,left: 15,right: 15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Shipping address",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
            SizedBox(height: 50,),
            AddressCard(),
            SizedBox(height: 40,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Order",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                Text("114\$",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)
              ],
            ),
            SizedBox(height: 40,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Delivery",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                Text("15\$",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)
              ],
            ),
            SizedBox(height: 40,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Summary",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                Text("150\$",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)
              ],
            ),
            SizedBox(height: 110,),
            CustomButton("Submit Order", () {
              Navigator.pushReplacementNamed(context, RouteNames.successOrder);
            })
          ],
        ),
      ),
    );
  }
}
