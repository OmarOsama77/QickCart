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

  NewItems(
      {
        this.fav,
      required this.id,
      required this.name,
      required this.image,
      required this.price,
      required this.gender});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<FavouriteCubit>(context);
    final cubit2 = BlocProvider.of<UserCubit>(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ShowDetails(
              price: price,
              gender: gender,
              weight: 'weight',
              name: name,
              imageUrl: image,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: SizedBox(
          height: 250,
          width: double.infinity,
          child: Row(
            children: [
              Container(
                height: 250,
                width: 100,
                child: Stack(
                  children: [
                    Center(
                      child: CircularProgressIndicator(),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        image,
                        height: 250,
                        width: 100,
                        fit: BoxFit.cover,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 36, left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        gender,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Price",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          Text("$price\$",
                              style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      BlocBuilder<ProductsCubit, ProductsState>(
                          builder: (context, state) {
                        return IconButton(
                          onPressed: () async {
                            cubit.addFavourite(
                                cubit2.userData!.uId!, id!.toString());
                            int c = id - 1;
                            Products p = await cubit.getProduct(c.toString());
                            cubit.favProducts.add(p);
                            // cubit.removeFav(cubit2.userData!.uId!, id!.toString());
                          },
                          icon: fav==true?Icon(Icons.favorite):Icon(Icons.favorite_border)
                        );
                      })
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
