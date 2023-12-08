import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quirkcart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:quirkcart/presentation/cubits/use_cubti/user_cubit.dart';

class CartItem extends StatelessWidget {
  String image;
  String name;
  num price;
  String id;
  num quantity;
  CartItem({required this.quantity,required this.id, required this.image, required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var cubit = BlocProvider.of<CartCubit>(context);
    var cubit2 = BlocProvider.of<UserCubit>(context);
    return
      Padding(
      padding: const EdgeInsets.only(top: 22),
      child: SizedBox(
        height: h / 5.5,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(22)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: h / 5.5,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(image),
                            fit: BoxFit.cover)),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 22, left: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "for male",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  IconButton(onPressed:(){
                                    cubit.increaseQuantaty(id,cubit2.userData!.uId!);
                                  }, icon: Icon(Icons.add)),
                                  Text(quantity.toString(),style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                                  IconButton(onPressed:(){
                                    cubit.decresseQuantaty(id,cubit2.userData!.uId!);
                                  }, icon: Icon(Icons.remove))
                                ],
                              )
                            ],
                          ),
                          Text(
                            "${quantity*price} \$",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
