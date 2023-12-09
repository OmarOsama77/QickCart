import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart' as http;
import 'package:quirkcart/data/network/api_constats.dart';
import 'package:quirkcart/models/cart.dart';
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
            address: userData["Address"],
            age: userData["age"],
            height: userData["height"],
            weight: userData["weight"],
            gender: userData["gender"]);

        users.add(user);
      });


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

  Future<void>uploadCart(String uId,Cart cart)async{
   try{
     var cartData = cart.toJson();
     CollectionReference usersCollection =
     FirebaseFirestore.instance.collection('users');
     DocumentReference userDocRef = usersCollection.doc(uId);
     await userDocRef.update({'cart': cartData});
   }catch(e){
     throw e.toString();
   }
  }

  Future<Cart?> getCart(String uId) async {
    try {
      CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');
      DocumentReference userDocRef = usersCollection.doc(uId);
      DocumentSnapshot userSnapshot = await userDocRef.get();
      Map<String, dynamic>? userData =
      userSnapshot.data() as Map<String, dynamic>;
      return Cart.fromJson(userData["cart"]);
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void>resetCart(String uId)async{
    try{
      CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');
      DocumentReference userDocRef = usersCollection.doc(uId);
      await userDocRef.update({'cart': null});
    }catch(e){
      throw e.toString();
    }
  }
  Future<void> uploadOrderedCart(String uId, Cart cart) async {
    CollectionReference usersCollection =
    FirebaseFirestore.instance.collection('users');
    DocumentReference userDocRef = usersCollection.doc(uId);

    DocumentSnapshot userSnapshot = await userDocRef.get();
    Map<String, dynamic>? userData = userSnapshot.data() as Map<String, dynamic>;

    List<dynamic> orderedList = userData['Ordered'] ?? [];

    orderedList.add(cart.toJson());
    await userDocRef.update({'Ordered': orderedList});
  }

  Future<void>uploadUserImage(File image, String userEmail)async{
    try{
      final storageReference = FirebaseStorage.instance.ref().child('profile_images/$userEmail');
      final UploadTask uploadTask = storageReference.putFile(image);
      final TaskSnapshot snapshot = await uploadTask;


    }catch(e){
      throw e.toString();
    }
  }
  Future<void> updateUserImage(File image,String userEmail)async{
    try{
      final storageReference = FirebaseStorage.instance.ref().child('profile_images/$userEmail');
      final UploadTask uploadTask = storageReference.putFile(image);
      final TaskSnapshot snapshot = await uploadTask;
    }catch(e){
      throw e.toString();
    }
  }

  Future<void> updateUserData(String userId,String fName,String sName,String address)async{
    try{
      CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');
      DocumentReference userDocRef = usersCollection.doc(userId);
      DocumentSnapshot userSnapshot = await userDocRef.get();
      Map<String, dynamic>? userData = userSnapshot.data() as Map<String, dynamic>;
      userData['firstName'] = fName;
      userData['secondName'] = sName;
      userData['Address'] = address;

      await userDocRef.update(userData!);
    }catch(e){
      throw e.toString();
    }
  }

}