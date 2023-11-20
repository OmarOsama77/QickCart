import 'dart:convert';
import 'dart:ui';

import 'package:http/http.dart' as http;
import 'package:quirkcart/data/network/api_constats.dart';
import 'package:quirkcart/models/products.dart';
import 'package:quirkcart/models/users.dart';

class ApiService {
  Future<void> uploadUserData(Users users) async {
    var bodyR = users.toJson();
    final url = Uri.https("${ApiConstants.baseUrl}", "/users/.json");
    final response = await http.post(url, body: jsonEncode(bodyR));

    if (response.statusCode == 200) {
      print('succes uploading data');
    }
    print('status code ${response.statusCode}');
  }

  List<Products> allProducts = [];

  Future<List<Products>> getAllProducts() async {
    try {
      int i = 0;
      final url = Uri.https(ApiConstants.baseUrl, "${ApiConstants.shop}.json");
      final response = await http.get(url);
      if (response.statusCode == 200) {
        Map<String, dynamic> shop = jsonDecode(response.body);
        List<dynamic> products = shop["products"];
        for (var p in products) {
          var product = Products(
              id: p["id"],
              gender: p["gender"],
              image_url: p["image_url"],
              name: p["name"],
              price: p["price"],
              weight: p["weight"]);

          allProducts.add(product);
        }
        return allProducts;
      }
      return [];
    } catch (e) {
      throw e.toString();
    }
  }

  List<Users> users = [];

  Future<List<Users>> getAllUsers() async {
    try {
      users.clear();
      final url = Uri.https("${ApiConstants.baseUrl}", "users.json");
      final response = await http.get(url);
      if (response.statusCode == 200) {
        print('response status ${response.statusCode}');
        Map<String, dynamic> usersMap = jsonDecode(response.body);
        print('map ${usersMap.length}');

        usersMap.forEach((key, value) {
          print('in the fffffffff');
          Users user = Users(value["firstName"], value["secondName"], value["email"],
              value["age"], value["height"], value["weight"], value["gender"]);
          print('omarrr $user');
          users.add(user);
        });
        print('Done in api ');
        return users;
      }
    } catch (e) {
      throw e.toString();
    }
    return [];
  }
}
