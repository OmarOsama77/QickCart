import 'package:quirkcart/data/network/api_service.dart';
import 'package:quirkcart/domain/repository/product_repository.dart';
import 'package:quirkcart/models/cart.dart';
import 'package:quirkcart/models/products.dart';
import 'package:quirkcart/models/users.dart';

class ProductsRepositoryImpl extends ProductRepository {
  ApiService apiService;

  ProductsRepositoryImpl(this.apiService);

  @override
  Future<List<Products>> getProducts() async {
    List<Products> products = await apiService.getAllProducts();
    return products;
  }

  List<Products> getReProducts(List<Products> products, Users user) {
    List<Products> reProducts = [];
    for (int i = 0; i < products.length; i++) {
      if (products[i].gender == user.gender) {
        List<String> weightS = products[i].weight.split(RegExp(r'[-\s]'));
        reProducts.add(products[i]);
      }
    }

    return reProducts;
  }

  @override
  Future<Set<String>> getFav(String uId) async {
    Set<String> fav = await apiService.getFavSet(uId);
    return fav;
  }

  @override
  Future<void> addFav(String uId, String pId) async {
    await apiService.addFav(uId, pId);
  }

  @override
  Future<Products> getProductById(String pId) async {
    Products pro = await apiService.getProductById(pId);
    return pro;
  }

  @override
  Future<void> removeFav(String uId, String pId) async {
    await apiService.removeFav(uId, pId);
  }

  @override
  Future<void> uploadCart(String uId, Cart cart) async {
    await apiService.uploadCart(uId, cart);
  }

}
