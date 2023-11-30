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
    final cubit = BlocProvider.of<FavouriteCubit>(context);
    final cubit2 = BlocProvider.of<UserCubit>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 22, left: 22, right: 22),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Favourite",
                style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                child:
               BlocBuilder<FavouriteCubit,FavouriteState>(builder:(context,state){
                 return  ListView.builder(
                     physics: const NeverScrollableScrollPhysics(),
                     shrinkWrap: true,
                     itemCount: cubit.favProducts.length,
                     itemBuilder: (context, index) {
                       return WishListItem(
                         id: cubit.favProducts[index].id,
                         name: cubit.favProducts[index].name,
                         price: cubit.favProducts[index].price,
                         image: cubit.favProducts[index].imageUrl,
                       );
                     });
               })
              )
            ]),
          ),
        ),
      ),
    );
  }
}
