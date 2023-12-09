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
    print('id $id');
    if (items.any((element) => element["id"] == id)) {
      print('Already in');
    }else{
      items.add({"id":id,"Quantity":1,"price":price,"qPrice":price});
      products.add(await productsRepositoryImpl.getProductById(id.toString()));
      print('Added');
    }
    print('Done');
  }

  num getCartPrice(){
    num price =0;
    for (var item in items){
      price+=item["qPrice"]!;
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

  void increaseQuantaty(String pId,String uId){
    print('pid ${pId}');
    for(var item in items){
      if(item["id"].toString()==pId){
        item["Quantity"]=(item["Quantity"]!+1);
        item["qPrice"] = item["price"]!*item["Quantity"]!;
        print('price ${item["qPrice"]}');
        myCart!.price= getCartPrice();
        emit(ItemIncreese());
        updateCart(uId, myCart!);
        break;
      }
    }
  }
  void decresseQuantaty(String pId,String uId){

    for(var item in items){
      if(item["id"].toString()==pId){
        if(item["Quantity"]==1){

        }else{
          item["Quantity"]=(item["Quantity"]!-1);
          item["qPrice"] =item["qPrice"]!-item["price"]!;
          print('price ${item["qPrice"]}');
          myCart!.price= getCartPrice();
          emit(ItemIncreese());
          updateCart(uId, myCart!);
          break;
        }
      }
    }
  }



  void resetCart() {
    items.clear();
    products.clear();
    myCart = null;
  }

  Future<Cart> getUserCart(String uId) async {
    try{
      print('iun get user cart');
      myCart = await productsRepositoryImpl.getCart(uId);
      print('mny cart ${myCart!.items}');
      items.addAll(myCart!.items!.map((item) {
        return {
          "id": item["id"] as int,
          "Quantity": item["Quantity"] as int,
          "price": item["price"] as num,
        };
      }).toList());
      for (var item in items){
        products.add(await productsRepositoryImpl.getProductById(item["id"].toString()));
      }
      print('items  ${items.length}  items in cart ');
      emit(ItemsCart());
      return myCart!;
    }catch(e){
      throw e.toString();
    }
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


