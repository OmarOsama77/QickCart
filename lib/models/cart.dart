import 'package:quirkcart/models/products.dart';

class Cart{
  String id;
  List<Products> items;

  Cart(this.id, this.items);
}