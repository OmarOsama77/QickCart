import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 22),
      child: Container(
        height: 150,
        child: Row(
          children: [
            Container(
              height: 200,
              width: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage("https://c4.wallpaperflare.com/wallpaper/476/932/966/cristiano-madrid-portugal-real-wallpaper-preview.jpg"),fit: BoxFit.contain)
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15,left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("H&M"),
                  SizedBox(height: 22,),
                  Text("Shirt",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                  SizedBox(height: 22,),
                  Text("32\$",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)
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
