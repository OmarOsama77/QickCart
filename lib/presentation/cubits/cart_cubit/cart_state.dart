part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class ItemsCart extends CartState{}

class ItemIncreese extends CartState{}

class InCartState extends CartState{}
