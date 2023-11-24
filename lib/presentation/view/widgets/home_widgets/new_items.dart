import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quirkcart/presentation/cubits/products_cubit/favourite_cubit.dart';
import 'package:quirkcart/presentation/cubits/products_cubit/products_cubit.dart';

import '../../screens/cart/show_details.dart';

class NewItems extends StatelessWidget {
 int index;
 String? uId;
 String id;
 String imageUrl ;
 String gender;
 num price;
 String name;
 String weight;
 bool favourite=false;
 NewItems({super.key,required this.uId,required this.id, required this.index, required this.name, required this.imageUrl,required this.gender,required this.price,required this.weight});

  @override
  Widget build(BuildContext context) {

    final cubit = BlocProvider.of<FavouriteCubit>(context);
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowDetails(
          price: price,
          gender: gender,
          weight: weight,
          name: name,
          imageUrl: imageUrl,
        )));
      },
      child: SizedBox(
        height: 250,
        width:double.infinity,
        child: Row(
          children: [
            Container(
              height: 250,
              width: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(imageUrl))),
            ),
           const SizedBox(width: 20,),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 36,left: 10,right: 10),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                   const SizedBox(height: 20,),
                    Text(gender,style:const TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                    const SizedBox(height: 20,),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const   Text("Price",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                        Text("${price}\$",style:const TextStyle(color:Colors.red,fontSize: 20,fontWeight: FontWeight.bold)),
                      ],
                    ),
                  BlocBuilder<FavouriteCubit,FavouriteState>(builder:(context,state){
                    return  IconButton(onPressed:()async{
                         if(favourite){
                           await  cubit.remove(id, uId!);
                           favourite = false;
                         }else{
                           await  cubit.addFav(id, uId!);
                           favourite = true;
                         }

                          }, icon: favourite? const Icon(Icons.favorite):
                    const Icon(Icons.favorite_border));
                  })

                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
