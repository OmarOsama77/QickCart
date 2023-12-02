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
   Map<int,num>items = {};
   List<Products> products=[];
   Future<void> addItem(int id,num price)async{
    if (items.containsKey(id)) {
      print('already in');
    } else {
      items[id] = price;
        products.add(await productsRepositoryImpl.getProductById(id.toString()));
      print('added');
    }
    print('Done');
  }

  num getPrice(){
     num price = 0;
     items.forEach((key, value) {
       price+=value;
     });
     return price;
  }
  Set<int> getProductsId(){
     Set<int> productsId = {};
     items.forEach((key, value) {
       productsId.add(key);
     });
     return productsId;
  }
  Cart? setCart(){
        myCart = Cart(
       id: Uuid().v4(),
       items: getProductsId(),
       price: getPrice(),
       ordered: false,
     );
     return myCart;
  }
  Future<void> updateCart(String uId,Cart cart)async{
     await productsRepositoryImpl.uploadCart(uId, cart);
  }



  void resetCart() {
    items.clear();
    products.clear();
    myCart = null;
  }
}
