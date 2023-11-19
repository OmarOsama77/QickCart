import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quirkcart/presentation/cubits/products_cubit/products_cubit.dart';
import 'package:quirkcart/presentation/view/widgets/home_widgets/item_card.dart';
import 'package:quirkcart/presentation/view/widgets/home_widgets/photo_carouse.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ProductsCubit>(context);
    cubit.getAllPosts();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 40,left: 15,right: 15),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome Omar, Have a greet shopping",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                  SizedBox(height: 50,),
                 const Text("Recomended Outfits",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                  SizedBox(height: 20,),
                  SizedBox(
                    height: 220,
                    child:
                    BlocBuilder<ProductsCubit,ProductsState>(builder: (context,state){
                     if(state is ProductsSuccess){
                       return   ListView.builder(
                           shrinkWrap: true,
                           scrollDirection: Axis.vertical,
                           itemCount: 5,
                           itemBuilder:(context,index){
                             return ItemCart(  image: cubit.products[index].image_url,
                               name: cubit.products[index].name,
                               price: cubit.products[index].price,);
                           });
                     }
                     return CircularProgressIndicator();
                    })
                  ),
                SizedBox(height: 20,),
                Text("New",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                BlocBuilder<ProductsCubit , ProductsState>(builder: (context,state){
                  if( state is ProductsSuccess){
                    return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: cubit.products.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder:(context,index){
                          return ItemCart(
                            image: cubit.products[index].image_url,
                            name: cubit.products[index].name,
                            price: cubit.products[index].price,
                          );
                        });
                  }
                  return CircularProgressIndicator();
                })
              ],
            ),
          ),
        ),
      )
    );
  }
}
