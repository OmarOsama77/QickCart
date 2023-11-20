import 'package:flutter/material.dart';

class NewItems extends StatelessWidget {
 String imageUrl ;
 String gender;
 num price;
 String name;

 NewItems({super.key, required this.name, required this.imageUrl,required this.gender,required this.price});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width:double.infinity,
      child: Row(
        children: [
          Container(
            height: 250,
            width: 100,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(imageUrl))),
          ),
         const SizedBox(width: 20,),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Container(
                height: 90,
                width: 270,
                child:   Text(
                  softWrap: true,
                  name,style:const TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
              ),
                const SizedBox(height: 10,),
                Text(gender,style:const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                const SizedBox(height: 15,),
                Row(
                  children: [
                   const Text("Price",style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    SizedBox(width: 10,),
                    Text("${price.toString()}\$",style:const TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.red),)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
