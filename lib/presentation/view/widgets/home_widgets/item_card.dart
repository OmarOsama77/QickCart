import 'package:flutter/material.dart';

class ItemCart extends StatelessWidget {
  const ItemCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Container(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 50,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 22, left: 5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 250,
                      width: 130,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/1.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Align(
                          alignment: Alignment.topRight,
                          child: IconButton(onPressed:(){}, icon: Icon(Icons.favorite_border))),
                    ),
                   SizedBox(height: 10,),
                    Text("Cool Outfit",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                    Text("13\$",style: TextStyle(fontSize: 22,color: Colors.red),)

                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
