import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  String image;
  String name;
  num price;

  CartItem({required this.image, required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return
      Padding(
      padding: const EdgeInsets.only(top: 22),
      child: SizedBox(
        height: h / 5.5,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(22)),
              child: Stack(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: h / 5.5,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage(image),
                                fit: BoxFit.cover)),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 22, left: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                name,
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "for male",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${price.toString()} \$",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Positioned(
                    right: 0,
                    top: 130,
                    bottom: 0,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFF2F2F2),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.favorite_border),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
