import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubits/use_cubti/user_cubit.dart';

class WishListItem extends StatelessWidget {
  String name;
  String image;
  num price;

  WishListItem({required this.name,required this.image,required this.price});

  @override
  Widget build(BuildContext context) {
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

            }, icon: Icon(Icons.close)),alignment: Alignment.topRight,),

          ],
        ),
      ),
    );
  }
}
