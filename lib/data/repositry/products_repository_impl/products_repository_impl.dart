import 'package:quirkcart/data/network/api_service.dart';
import 'package:quirkcart/domain/repository/product_repository.dart';
import 'package:quirkcart/models/products.dart';

class ProductsRepositoryImpl extends ProductRepository{
  ApiService apiService;

  ProductsRepositoryImpl(this.apiService);

  @override
  Future<List<Products>> getProducts() async{
    List<Products> products =  await apiService.getAllProducts();
    return products;
  }

}