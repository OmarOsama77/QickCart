import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quirkcart/data/repositry/products_repository_impl/products_repository_impl.dart';
import 'package:quirkcart/models/products.dart';
import 'package:uuid/uuid.dart';
import '../../../models/cart.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.productsRepositoryImpl) : super(CartInitial());
  ProductsRepositoryImpl productsRepositoryImpl;
  Cart? myCart;
  List<Map<String,num>>items=[];
  List<Products>products=[];

  Future<void> addItem(int id,num price)async{
    if(items.any((element) =>element.containsKey(id))){
      print('Already in');
    }else{
      items.add({id.toString():price});
      products.add(await productsRepositoryImpl.getProductById(id.toString()));
      print('Added');
    }
    print('Done');
  }

  num getCartPrice(){
    num price =0;
    for (int i=0;i<items.length;i++){
       items[i].forEach((key, value) {
         price+=value;
       });
    }
    return price;
  }

  Cart getCart(){
    myCart=Cart(
      price: getCartPrice(),
      ordered: false,
      items: items,
    );
    return myCart!;
  }

  void resetCart() {
    items.clear();
    products.clear();
    myCart = null;
  }

  Future<Cart> getUserCart(String uId) async {
    print('iddasd');
    myCart = await productsRepositoryImpl.getCart(uId);

    return myCart!;
  }

  Future<void> updateCart(String uId, Cart cart) async {
    await productsRepositoryImpl.uploadCart(uId, cart);
  }

  Future<void>resetCartFromDB(String uId)async{
    await productsRepositoryImpl.resetCart(uId);
  }
  Future<void>uploadOrderedCart(String uId)async{
    await productsRepositoryImpl.uploadOrderedCart(uId, myCart!);
  }


}


