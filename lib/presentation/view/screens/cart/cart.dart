import 'package:flutter/material.dart';
import 'package:quirkcart/presentation/view/widgets/cart_widgets/cart_item.dart';

import '../../../../utils/routes/routes_names.dart';
import '../../widgets/auth_widgets/custom_button.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:const EdgeInsets.only(top: 50,left: 20,right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("My Bag",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              Expanded(
                child: ListView.builder(
                  itemCount:10,
                  itemBuilder: (context, index) {
                   return CartItem();
                  },
                ),
              ),
              Divider(),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total Price",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                  Text("124\$",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)
                ],
              ),
              SizedBox(height: 20),
              CustomButton("CheckOut", () {
                Navigator.pushNamed(context, RouteNames.checkOut);
              })
            ],
          ),
        ),
      ),
    );
  }
}
