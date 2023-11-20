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
    reProducts = productRepository.getReProducts(products, user);
    print('done ${reProducts.length}');
    return reProducts;
  }
}
