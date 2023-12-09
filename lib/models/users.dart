import 'package:quirkcart/models/cart.dart';
class Users {
  String? uId;
  String fName;
  String sName;
  String email;
  String age;
  int height;
  int weight;
  String gender;
  String address;
  String? profileImageURL;
  Set<String>? fav;
 List<Cart>? ordered;
 Cart? cart;

  Users(
      {this.fav,
      this.uId,
        this.profileImageURL,
        this.ordered,
        this.cart,
      required this.fName,
      required this.sName,
      required this.email,
      required this.age,
      required this.height,
      required this.weight,
      required this.address,
      required this.gender});

  Map<String, dynamic> toJson() {
    return {
      "firstName": fName,
      "secondName": sName,
      "email": email,
      "age": age,
      "Address":address,
      "height": height,
      "weight": weight,
      "gender": gender,
      "fav": <String>{},
      "Ordered": [],
      "profileImageURL": profileImageURL,
      "cart" :cart,
    };
  }
}
