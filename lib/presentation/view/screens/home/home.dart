import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quirkcart/presentation/cubits/products_cubit/favourite_cubit.dart';
import 'package:quirkcart/presentation/cubits/products_cubit/products_cubit.dart';
import 'package:quirkcart/presentation/cubits/use_cubti/user_cubit.dart';
import 'package:quirkcart/presentation/view/widgets/home_widgets/new_items.dart';
import 'package:quirkcart/presentation/view/widgets/home_widgets/recomended_item.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ProductsCubit>(context);
    final cubit2 = BlocProvider.of<UserCubit>(context);
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Welcome, ${cubit2.userData!.fName}",
                    style:
                        const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  CircleAvatar(
                    radius: 22,
                    backgroundImage: NetworkImage(cubit2.userData!.profileImageURL.toString()),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Suggestion for you",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 29,
              ),
              BlocBuilder<ProductsCubit, ProductsState>(
                  builder: (context, state) {
                if (state is ProductsSuccess) {
                  return cubit.reProducts.isNotEmpty? SizedBox(
                    height: 250,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: cubit.reProducts.length,
                        itemBuilder: (context, index) {
                          return RecommendedItem(
                            id: cubit.reProducts[index].id,
                              gender: cubit.reProducts[index].gender,
                              weight: cubit.reProducts[index].weight,
                              name: cubit.reProducts[index].name,
                              image: cubit.reProducts[index].imageUrl,
                              price: cubit.reProducts[index].price);
                        }),
                  ):
                 const SizedBox(
                    height: 250,
                    child: Center(
                      child: Text("There is no recommended products,sorry",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                    ),
                  )
                  ;
                }
                return const Center(
                  child: CircularProgressIndicator(color: Color(0xFFDB3022)),
                );
              }),
              const SizedBox(
                height: 45,
              ),
              const Text(
                "New Products",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(child: BlocBuilder<FavouriteCubit, FavouriteState>(
                  builder: (context, state) {
                return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: cubit.hProducts.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return NewItems(
                        weight: cubit.hProducts[index].weight,
                        index: index,
                        fav: cubit.hProducts[index].fav,
                        id: cubit.hProducts[index].id,
                        image: cubit.hProducts[index].imageUrl,
                        name: cubit.hProducts[index].name,
                        price: cubit.hProducts[index].price,
                        gender: cubit.hProducts[index].gender,
                      );
                    });
              }))
            ],
          ),
        ),
      ),
    ));
  }
}
