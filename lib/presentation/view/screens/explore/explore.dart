import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quirkcart/presentation/cubits/products_cubit/products_cubit.dart';
import 'package:quirkcart/presentation/view/widgets/explore_widgets/explore_item.dart';

import '../../../cubits/products_cubit/favourite_cubit.dart';

class Explore extends StatelessWidget {
  const Explore({Key? key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<ProductsCubit>(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Explore",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: cubit.products.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return  BlocBuilder<FavouriteCubit, FavouriteState>(builder:(context,state){
                          return      ExploreItem(
                              index: index,
                              fav: cubit.products[index].fav!,
                              gender: cubit.products[index].gender,
                              weight: cubit.products[index].weight,
                              id: cubit.products[index].id,
                              imageUrl: cubit.products[index].imageUrl,
                              name: cubit.products[index].name,
                              price: cubit.products[index].price);
                        });
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
