import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quirkcart/models/products.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  List<Products>items=[];

  void addItem(Products products){
     items.add(products);
  }
}
