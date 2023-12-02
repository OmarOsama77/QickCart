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
  Set<int>productId={};
  Set<num>productPrice={};
  List<Products>products=[];

  Future<void> addItem(int id,num price)async{
    if(productId.contains(id)){
      print('Already in');
    }else{
      productId.add(id);
      productPrice.add(price);
      products.add(await productsRepositoryImpl.getProductById(id.toString()));
      print('Added');
    }
    print('Done');
  }

  num getCartPrice(){
    num price =0;
    for (int i=0;i<productPrice.length;i++){
      price+=productPrice.elementAt(i);
    }
    return price;
  }

  Cart getCart(){
    myCart=Cart(
      price: getCartPrice(),
      id: Uuid().v4(),
      ordered: false,
      items: productId,
    );
    return myCart!;
  }

  void resetCart() {
    productId.clear();
    productPrice.clear();
    products.clear();
    myCart = null;
  }

  Future<Cart> getUserCart(String uId) async {
    myCart = await productsRepositoryImpl.getCart(uId);

    productId.addAll(myCart!.items!);
    productPrice.add(myCart!.price!);
    myCart!.items?.forEach((element) async {
      products.add(await productsRepositoryImpl.getProductById(element.toString()));
    });
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


