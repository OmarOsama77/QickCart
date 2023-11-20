import 'package:quirkcart/models/products.dart';
import 'package:quirkcart/models/users.dart';

abstract class ProductRepository{
  Future<List<Products>> getProducts();
  List<Products> getReProducts(List<Products>products,Users user);
}