import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    cubit.getReProducts(cubit.products, cubit2.userData!);
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome, ${cubit2.userData!.fName}",
                style:const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
                  return SizedBox(
                    height: 250,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: cubit.reProducts.length,
                        itemBuilder: (context, index) {
                          return RecommendedItem(
                              gender: cubit.reProducts[index].gender,
                              weight: cubit.reProducts[index].weight,
                              name: cubit.reProducts[index].name,
                              image: cubit.reProducts[index].image_url,
                              price: cubit.reProducts[index].price);
                        }),
                  );
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
              SizedBox(
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: cubit.hProducts.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return NewItems(
                        uId: cubit2.userData!.uId,
                        id: cubit.hProducts[index].id.toString(),
                        index: index,
                        weight: cubit.hProducts[index].weight,
                        price: cubit.hProducts[index].price,
                        name: cubit.hProducts[index].name,
                        gender: cubit.hProducts[index].gender,
                        imageUrl: cubit.hProducts[index].image_url,
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
