import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/products.dart';
import '../../../cubits/products_cubit/favourite_cubit.dart';
import '../../../cubits/products_cubit/products_cubit.dart';
import '../../../cubits/use_cubti/user_cubit.dart';
import '../../screens/cart/show_details.dart';

class ExploreItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final num price;
  final int id;
  final String gender;
  final String weight;
  final  bool fav;
  final int index;

  ExploreItem(
      {
        required this.index,
        required  this.fav,
      required this.imageUrl,
        required this.name,
        required  this.price,
        required  this.id,
        required  this.gender,
        required  this.weight});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<FavouriteCubit>(context);
    final cubit2 = BlocProvider.of<UserCubit>(context);
    final cubit3 = BlocProvider.of<ProductsCubit>(context);
    var h = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ShowDetails(
              id: id,
              price: price,
              gender: gender,
              weight: weight,
              name: name,
              imageUrl: imageUrl,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 22),
        child: Container(
          decoration:const  BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.07450980392156863),
                blurRadius: 35.0,
              )
            ],
          ),
          height: h / 5.5,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    color:const Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(22)),
                child: Stack(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: h / 5.5,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(imageUrl),
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
                                  style:const TextStyle(
                                      fontSize: 17, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "for $gender",
                                  style:const TextStyle(
                                      fontSize: 17, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "${price.toString()} \$",
                                  style:const TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 22),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Positioned(
                      right: 0,
                      top: 130,
                      bottom: 0,
                      child: GestureDetector(
                        onTap: () async {
                          if (fav == true) {
                            cubit.removeFav(cubit2.userData!.uId!, id.toString(), name);
                            cubit3.hProducts[index].fav = false;
                            cubit3.products[index].fav = false;
                          } else {
                            cubit.addFavourite(cubit2.userData!.uId!, id.toString());
                            int c = id - 1;
                            Products p = await cubit.getProduct(c.toString());
                            cubit.favProducts.add(p);
                            cubit3.hProducts[index].fav = true;
                            cubit3.products[index].fav = true;
                          }
                        },

                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xFFF2F2F2),
                          ),
                          child: Icon(
                            (fav ?? false) ? Icons.favorite : Icons.favorite_border,
                          ),


                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}