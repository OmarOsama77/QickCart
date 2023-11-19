import 'package:quirkcart/models/products.dart';

abstract class ProductRepository{
  Future<List<Products>> getProducts();
}