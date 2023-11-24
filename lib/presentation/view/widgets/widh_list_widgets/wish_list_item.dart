import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/products_cubit/favourite_cubit.dart';
import '../../../cubits/use_cubti/user_cubit.dart';

class WishListItem extends StatelessWidget {
  String image;
  String name;
  num price;
  int? index;
  int id;
  WishListItem({required this.id, required this.index, required this.image,required this.name,required this.price});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<FavouriteCubit>(context);
    var cubit2 = BlocProvider.of<UserCubit>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 22,bottom: 10),
      child: Container(
        height: 150,
        child: Row(
          children: [
            Container(
              height: 200,
              width: 100,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(image),fit: BoxFit.contain)
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15,left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      child: Text(name,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                    width: 122,
                    height: 80,
                  ),
                  SizedBox(height: 22,),
                  Text("$price\$",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)
                ],
              ),
            ),
            Spacer(),
            Align(child: IconButton(onPressed:(){
                cubit.remove(index.toString(), cubit2.userData!.uId!);
            }, icon: Icon(Icons.close)),alignment: Alignment.topRight,),

          ],
        ),
      ),
    );
  }
}
