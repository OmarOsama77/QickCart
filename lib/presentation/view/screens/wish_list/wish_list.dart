import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quirkcart/presentation/cubits/products_cubit/favourite_cubit.dart';
import 'package:quirkcart/presentation/cubits/products_cubit/products_cubit.dart';
import 'package:quirkcart/presentation/cubits/use_cubti/user_cubit.dart';
import 'package:quirkcart/presentation/view/widgets/widh_list_widgets/wish_list_item.dart';

class WishList extends StatelessWidget {
  const WishList({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<FavouriteCubit>(context);
    var cubit2 = BlocProvider.of<UserCubit>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 22, left: 22, right: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Favourite",
                  style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
                ),
                FutureBuilder(
                    future: cubit.getAllFav(cubit2.userData!.uId!).then(
                        (value) => cubit.favProduct(cubit.favourite)),
                    builder: (context, snapshoot) {
                      if (snapshoot.connectionState ==
                          ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return SizedBox(
                        child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: cubit.fav.length,
                             itemBuilder: (context, index) {
                              return WishListItem(
                                id: cubit.fav[index].id,
                                index: index,
                                price: cubit.fav[index].price,
                                name:  cubit.fav[index].name,
                                image:  cubit.fav[index].image_url,
                              );
                            }),
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
