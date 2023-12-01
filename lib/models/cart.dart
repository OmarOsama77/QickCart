import 'package:quirkcart/models/products.dart';

class Cart{
  String id;
  List<Products> items;
  num price;
  Cart(this.id, this.items,this.price);
}