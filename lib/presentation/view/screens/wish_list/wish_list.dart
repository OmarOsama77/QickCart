import 'package:flutter/material.dart';
import 'package:quirkcart/presentation/view/widgets/widh_list_widgets/wish_list_item.dart';

class WishList extends StatelessWidget {
  const WishList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 22,left: 22,right: 22),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Favourite",style: TextStyle(fontSize: 42,fontWeight: FontWeight.bold),),
                SizedBox(
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 15,
                      itemBuilder:(context,index){
                    return WishListItem();
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
