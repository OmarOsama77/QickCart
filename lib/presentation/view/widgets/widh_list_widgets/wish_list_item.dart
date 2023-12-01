import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quirkcart/presentation/cubits/products_cubit/favourite_cubit.dart';
import 'package:quirkcart/presentation/cubits/products_cubit/products_cubit.dart';
import '../../../cubits/use_cubti/user_cubit.dart';

class WishListItem extends StatelessWidget {
  String image;
  num price;
  String name;
  int id;
  WishListItem({required this.image,required this.price,required this.name,required this.id});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<FavouriteCubit>(context);
    var cubit2 = BlocProvider.of<UserCubit>(context);
    var cubit3 = BlocProvider.of<ProductsCubit>(context);
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
            Align(alignment: Alignment.topRight,child: IconButton(onPressed:(){
                          cubit.removeFav(cubit2.userData!.uId!, (id).toString(),name);
                          cubit.changeFavIcon(cubit3.hProducts, id);
                  }, icon: Icon(Icons.close)),),

          ],
        ),
      ),
    );
  }
}
