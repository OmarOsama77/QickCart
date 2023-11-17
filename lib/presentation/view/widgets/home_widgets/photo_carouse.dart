import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
class PhotoCarousel extends StatelessWidget {
  final List<String> imagePaths = [
    "https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/H%26M-Logo.svg/640px-H%26M-Logo.svg.png",
    "https://1000logos.net/wp-content/uploads/2019/06/Cr7-logo.jpg",
    "https://static.nike.com/a/images/f_jpg,q_auto:eco/61b4738b-e1e1-4786-8f6c-26aa0008e80b/swoosh-logo-black.png"
  ];
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 300,
        autoPlay: true,
        aspectRatio: 99,
        enlargeCenterPage: true,
      ),
      items: imagePaths.map((imagePath) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: Image.network(
                imagePath,   height: 300,
                fit: BoxFit.cover,
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
