import 'package:quirkcart/models/cart.dart';
class Users {
  String? uId;
  String fName;
  String sName;
  String email;
  String age;
  String height;
  String weight;
  String gender;
  Set<String>? fav;
 List<Cart>? ordered;
 Cart? cart;

  Users(
      {this.fav,
      this.uId,
        this.ordered,
        this.cart,
      required this.fName,
      required this.sName,
      required this.email,
      required this.age,
      required this.height,
      required this.weight,
      required this.gender});

  Map<String, dynamic> toJson() {
    return {
      "firstName": fName,
      "secondName": sName,
      "email": email,
      "age": age,
      "height": height,
      "weight": weight,
      "gender": gender,
      "fav": <String>{},
      "Ordered": [],
      "cart" :cart,
    };
  }
}
