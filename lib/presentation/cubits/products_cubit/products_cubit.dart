import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quirkcart/domain/repository/product_repository.dart';
import 'package:quirkcart/models/products.dart';
import 'package:quirkcart/models/users.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productRepository) : super(ProductsInitial());
  ProductRepository productRepository;
  List<Products> products = [];
  List<Products> reProducts = [];
  List<Products> hProducts = [];

  Future<List<Products>> getAllPosts() async {
    try {
      emit(ProductsLoading());
      products = await productRepository.getProducts();
      emit(ProductsSuccess());
      return products;
    } catch (e) {
      emit(ProductsFailed());
      throw e.toString();
    }
  }

  bool gotProducts = false;

  List<Products> getReProducts(List<Products> products, Users user) {
   reProducts.clear();

      for (int i=0;i<products.length;i++){
       if(products[i].gender==user.gender){
         List<String> wordS = products[i].weight.split(RegExp(r'[-\s]'));
         if(wordS[0]=="over"&&user.weight>90){
           reProducts.add(products[i]);
         }
         if(wordS[0]!="over"){
           if(int.parse(wordS[0])<user.weight&&int.parse(wordS[1])>user.weight){
             print('omar ${int.parse(wordS[0])}   ${int.parse(wordS[1])}    w ${user.weight}');
             reProducts.add(products[i]);
           }
         }
       }
    }

    return reProducts;
  }

  List<Products> getHomeProducs() {
    for (int i = 0; i < 11; i++) {
      hProducts.add(products[i]);
    }
    return hProducts;
  }

  Future<void> setFavProducts(Set<String> fav) async {
    for (int i = 0; i < products.length; i++) {
      for (int j = 0; j < fav.length; j++) {
        int c = products[i].id - 1;
        if (c.toString() == fav.elementAt(j)) {
          products[i].fav = true;

          break;
        }
      }

      if (products[i].fav == null) {
        products[i].fav = false;
      }
    }
  }

  void removeFav(int id) {
    for (int i = 0; i < products.length; i++) {
      if (products[i].id == id) {
        products[i].fav = false;
      }
    }
  }
}
// List<String> wordS = products[i].weight.split(RegExp(r'[-\s]'));