import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {

  String image;
  String name;
  num price;

  CartItem({required this.image,required this.name,required this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 22,bottom: 20),
      child: Container(
        height: 200,

        child: Row(
          children: [
            Container(
              height: 200,
              width: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(image),fit: BoxFit.contain)
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15,left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 22,),
                  SizedBox(
                      width: 200,
                      child: Text(name,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)),
                  SizedBox(height: 22,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("$price\$",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                      Row(
                        children: [
                          IconButton(onPressed:(){

                          }, icon: Icon(Icons.arrow_upward)),
                          Text('1',style: TextStyle(fontSize: 22),),
                          IconButton(onPressed:(){

                          }, icon: Icon(Icons.arrow_downward))
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Spacer(),
            Align(child: IconButton(onPressed:(){}, icon: Icon(Icons.close)),alignment: Alignment.topRight,),

          ],
        ),
      ),
    );
  }
}
