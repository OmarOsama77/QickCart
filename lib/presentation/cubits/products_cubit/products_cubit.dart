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
  List<Products> getReProducts(List<Products>products,Users user){
    reProducts.clear();
    int c=0;
    c=0;
    print('usserrr ${user.weight}');
    for (int i=0;i<products.length;i++){
         List<String> wordS = products[i].weight.split(RegExp(r'[-\s]'));
       if(products[i].gender == user.gender){
        if(wordS[0]=="over"&&int.parse(user.weight)>int.parse(wordS[1])){
          reProducts.add(products[i]);
        }else if(wordS[0]!="over"&&int.parse(user.weight)>int.parse(wordS[0])){
          reProducts.add(products[i]);
        }
       }
       c+=1;
       wordS.clear();
     }
     print('re ${reProducts.length}');
    return reProducts;
  }
}
