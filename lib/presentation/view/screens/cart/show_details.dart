import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quirkcart/models/cart.dart';
import 'package:quirkcart/models/products.dart';
import 'package:quirkcart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:quirkcart/presentation/cubits/use_cubti/user_cubit.dart';

class ShowDetails extends StatelessWidget {
  int? id;
  String? imageUrl ;
  String? name;
  num? price;
  String? weight;
  String? gender;
  ShowDetails({this.id,this.imageUrl, this.name,this.weight,this.price,this.gender});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<CartCubit>(context);
    var cubit2 = BlocProvider.of<UserCubit>(context);
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed:(){
          Navigator.pop(context);
        }, icon:const Icon(Icons.arrow_back_ios_new,color: Colors.black,)),
        title: Text(name.toString(),style:const TextStyle(fontSize: 20,color: Colors.black),),
        centerTitle: true,
        actions: [
            IconButton(onPressed:(){}, icon:const Icon(Icons.share,color: Colors.black,))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: SizedBox(
            height: h-150,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                      image: DecorationImage(image:NetworkImage(imageUrl.toString()))
                  ),
                ),
                SizedBox(height: 10,),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    color: Colors.grey[200]!,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 22,left: 12,right: 12),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  width: w-90,
                                  child: Text(name!,style: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)),
                              Text("${price.toString()}\$",style:const TextStyle(color: Colors.red,fontSize: 22,fontWeight: FontWeight.bold),)
                            ],
                          ),
                          const SizedBox(height: 20,),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("For ${gender!}",style:const TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                              Text(weight.toString(),style:const TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)
                            ],
                          ),

                          Expanded(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: ElevatedButton(
                                  onPressed:()async{
                                    cubit.addItem(id!-1,price!);
                                   Cart? cart= cubit.getCart();
                                   await cubit.updateCart(cubit2.userData!.uId!, cart!);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      fixedSize:const Size(2000, 50),
                                      primary:const Color(0xFFDB3022),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      )),
                                  child: const Text("Add to cart")),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
