import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:quirkcart/data/network/api_constats.dart';
import 'package:quirkcart/models/products.dart';
import 'package:quirkcart/models/users.dart';
import 'package:quirkcart/models/products.dart';

class ApiService {
  List<Products> allProducts = [];

  Future<void> uploadUserData(Users users) async {
    var bodyR = users.toJson();
    CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('users');
    await usersCollection.add(bodyR);
  }

  Future<List<Products>> getAllProducts() async {
    try {
      int i = 0;
      final url = Uri.https(ApiConstants.baseUrl, "${ApiConstants.shop}.json");
      final response = await http.get(url);
      if (response.statusCode == 200) {
        Map<String, dynamic> shop = jsonDecode(response.body);
        List<dynamic> products = shop["products"];
        for (int index = 0; index < products.length; index++) {
          var p = products[index];
          Products product = Products(
              id: p["id"],
              gender: p["gender"],
              imageUrl: p["image_url"],
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
      CollectionReference usersCollection =
          FirebaseFirestore.instance.collection('users');
      QuerySnapshot querySnapshot = await usersCollection.get();
      querySnapshot.docs.forEach((DocumentSnapshot document) {
        Map<String, dynamic> userData = document.data() as Map<String, dynamic>;
        Users user = Users(
            fav: (userData['fav'] as List<dynamic>?)?.cast<String>().toSet() ??
                <String>{},
            uId: document.id,
            fName: userData["firstName"],
            sName: userData["secondName"],
            email: userData["email"],
            age: userData["age"],
            height: userData["height"],
            weight: userData["weight"],
            gender: userData["gender"]);

        users.add(user);
      });

      print('Done in API');
      return users;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<Set<String>> getFavSet(String userId) async {
    CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('users');
    DocumentReference userDocRef = usersCollection.doc(userId);
    try{
      DocumentSnapshot userSnapshot = await userDocRef.get();
      if(userSnapshot.exists){
      Map<String,dynamic>?userData = userSnapshot.data() as Map<String,dynamic>;
        List<dynamic>fav = userData["fav"];
        Set<String>f = Set<String>.from(fav);
        return f;
      }
      return {};
    }catch(e){
      throw e.toString();
    }
  }
  Future<void> addFav(String uId , String pId)async{
    try{
      CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');
      DocumentReference userDocRef = usersCollection.doc(uId);
      Set<String> currentFavSet = await getFavSet(uId);
      currentFavSet.add(pId);
      await userDocRef.update({'fav': currentFavSet.toList()});
    }catch(e){
      throw e.toString();
    }
  }
 Future<Products> getProductById(String pId)async{
   final url = Uri.https(ApiConstants.baseUrl, "${ApiConstants.shop}/products/$pId.json");
   final res = await http.get(url);
   if(res.statusCode==200){
    Map<String ,dynamic>pro = jsonDecode(res.body);
    Products product = Products(id: pro["id"], gender: pro["gender"], imageUrl: pro["image_url"], name: pro["name"], price: pro["price"], weight: pro["weight"]);
    return product;
   }
  return Products(id: 0, gender: 'gender', imageUrl: 'image_url', name: 'name', price: 2, weight: 'weight');
  }
  Future<void> removeFav(String uId, String pId) async {
    try {
      CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');
      DocumentReference userDocRef = usersCollection.doc(uId);
      Set<String> currentFavSet = await getFavSet(uId);
      currentFavSet.remove(pId);
      await userDocRef.update({'fav': currentFavSet.toList()});

    } catch (e) {
      throw e.toString();
    }
  }


}