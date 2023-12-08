import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quirkcart/presentation/cubits/use_cubti/user_cubit.dart';
import 'package:quirkcart/presentation/view/screens/cart/check_out.dart';
import 'package:quirkcart/presentation/view/widgets/cart_widgets/cart_item.dart';
import '../../../cubits/cart_cubit/cart_cubit.dart';
import '../../widgets/auth_widgets/custom_button.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<CartCubit>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:const EdgeInsets.only(top: 50,left: 20,right: 20),
          child: 
         BlocBuilder<CartCubit,CartState>(builder:(context,state){
            if(cubit.myCart!=null){
                return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("My Bag",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                  Expanded(
                    child: ListView.builder(
                      itemCount:cubit.products.length,
                      itemBuilder: (context, index) {
                        return CartItem(
                          id: (cubit.products[index].id - 1).toString(),
                          image:cubit.products[index].imageUrl,
                          price:cubit.products[index].price,
                          name:cubit.products[index].name,
                        );
                      },
                    ),
                  ),
                  Divider(),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total Price",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                      Text(cubit.products.isNotEmpty?"${cubit.myCart!.price}\$":"0\$",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color:  Color(0xFFDB3022)),)
                    ],
                  ),
                  SizedBox(height: 20),
                  CustomButton("CheckOut", () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder:(context)=>CheckOut(cubit.products.isNotEmpty?cubit.myCart!.price:0))
                    );
                  }),
                  SizedBox(height: 12,),
                ],
              );
            }else{
              return Center(
                child:Text("NO Items in cartr"),
              );
            }
         })
        ),
      ),
    );
  }
}
