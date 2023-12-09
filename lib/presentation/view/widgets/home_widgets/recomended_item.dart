import 'package:flutter/material.dart';
import 'package:quirkcart/presentation/view/screens/cart/show_details.dart';

class RecommendedItem extends StatelessWidget {
  String gender;
  String name;
  String image;
  int id;
  num price;
  String weight;

  RecommendedItem({required this.id, required this.name, required this.image, required this.price, required this.weight, required this.gender});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ShowDetails(
              id: id,
              price: price,
              gender: gender,
              weight: weight,
              name: name,
              imageUrl: image,
            ),
          ),
        );
      },
      child: Container(
        height: 250,
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              width: 100,
              child: Stack(
                children: [
                  Center(
                    child: CircularProgressIndicator(),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      image,
                      height: 150,
                      width: 100,
                      fit: BoxFit.cover,
                      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,),
            SizedBox(
              height: 50,
              width: 90,
              child: Text(
                name,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10,),
            Text(
              "$price\$".toString(),
              style: TextStyle(fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
