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
                      width: 180,
                      child: Text(name,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)),
                  SizedBox(height: 22,),
                  Text("$price\$",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)
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
