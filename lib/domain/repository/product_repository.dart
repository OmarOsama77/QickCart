import 'package:quirkcart/models/products.dart';
import 'package:quirkcart/models/users.dart';

import '../../models/cart.dart';

abstract class ProductRepository{
  Future<List<Products>> getProducts();
  List<Products> getReProducts(List<Products>products,Users user);
  Future<Set<String>> getFav(String uId);
  Future<void> addFav(String uId,String pId);
  Future<Products> getProductById(String pId);
  Future<void> removeFav(String uId,String pId);
  Future<void> uploadCart(String uId,Cart cart);
}