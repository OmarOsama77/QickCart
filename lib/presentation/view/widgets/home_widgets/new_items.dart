import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quirkcart/models/products.dart';
import 'package:quirkcart/presentation/cubits/products_cubit/favourite_cubit.dart';

import 'package:quirkcart/presentation/cubits/products_cubit/products_cubit.dart';
import 'package:quirkcart/presentation/cubits/use_cubti/user_cubit.dart';

import '../../screens/cart/show_details.dart';

class NewItems extends StatelessWidget {
  int id;
  String name;
  String image;
  num price;
  String gender;
  bool? fav;
  int index;
  String weight;
  NewItems(
      {
        required this.weight,
        this.fav,
        required this.index,
      required this.id,
      required this.name,
      required this.image,
      required this.price,
      required this.gender});

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
              id:id,
              price: price,
              gender: gender,
              weight: weight,
              name: name,
              imageUrl: image,
            ),
          ),
        );
      },
      child:
      Padding(
        padding: const EdgeInsets.only(top: 22),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
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
                    color: Color(0xFFFFFFFF),
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
                                Text(
                                  "for $gender",
                                  style: TextStyle(
                                      fontSize: 17, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "${price.toString()} \$",
                                  style: TextStyle(
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
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFFF2F2F2),
                        ),
                        child:IconButton(
                            onPressed: () async {
                              if(fav==null){
                                print('innn');
                                cubit.addFavourite(
                                    cubit2.userData!.uId!, id!.toString());
                                int c = id - 1;
                                Products p = await cubit.getProduct(c.toString());
                                cubit.favProducts.add(p);
                                cubit3.hProducts[index].fav = true;

                              }else{
                                print('else');
                                cubit.removeFav(cubit2.userData!.uId!, id!.toString(),name);
                                cubit3.hProducts[index].fav = null;
                              }

                            },
                            icon: fav==true?Icon(Icons.favorite):Icon(Icons.favorite_border)
                        )
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