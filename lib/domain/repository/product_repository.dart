import 'package:quirkcart/models/products.dart';
import 'package:quirkcart/models/users.dart';

abstract class ProductRepository{
  Future<List<Products>> getProducts();
  List<Products> getReProducts(List<Products>products,Users user);
  Future<void> addFavourite(String pId,String userId);
  Future<void> removeFavourite(String pId,String uId);
  Future<List<String>> getFav(String uId);
  Future<Products> getProductById(String pId);
}