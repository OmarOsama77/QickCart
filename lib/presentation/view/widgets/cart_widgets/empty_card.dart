import 'package:flutter/material.dart';

class EmptyCard extends StatelessWidget {
  const EmptyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
      child: Column(crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Icon(Icons.shopping_cart,size: 90,),
          Text("Sorry,Empty cart",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)
        ],
      ),
      ),
    );
  }
}
