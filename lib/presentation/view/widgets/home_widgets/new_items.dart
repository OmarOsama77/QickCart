import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quirkcart/models/products.dart';
import 'package:quirkcart/presentation/cubits/products_cubit/favourite_cubit.dart';
import 'package:quirkcart/presentation/cubits/products_cubit/products_cubit.dart';

import '../../screens/cart/show_details.dart';

class NewItems extends StatelessWidget {
  int index;
  String? uId;
  String id;
  String imageUrl;
  String gender;
  num price;
  String name;
  String weight;
  bool? favourite ;

  NewItems({
    super.key,
      this.favourite,
    required this.uId,
    required this.id,
    required this.index,
    required this.name,
    required this.imageUrl,
    required this.gender,
    required this.price,
    required this.weight,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<FavouriteCubit>(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ShowDetails(
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
                        imageUrl,
                        height: 250,
                        width: 100,
                        fit: BoxFit.cover,
                        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
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
              const SizedBox(width: 20,),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 36, left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20,),
                      Text(
                        gender,
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Price", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          Text("${price}\$", style: const TextStyle(color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      BlocBuilder<ProductsCubit, ProductsState>(builder: (context, state) {
                        return
                          IconButton(
                            onPressed: () async {
                              cubit.addFav(uId!, index.toString());
                              Products p = Products(id: index, gender: gender, imageUrl: imageUrl, name: name, price: price, weight: weight);
                              cubit.favProducts.add(p);
                            },
                            icon: Icon(favourite ?? false ? Icons.favorite : Icons.favorite_border),
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
