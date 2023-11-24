import 'package:quirkcart/data/network/api_service.dart';
import 'package:quirkcart/domain/repository/product_repository.dart';
import 'package:quirkcart/models/products.dart';
import 'package:quirkcart/models/users.dart';

class ProductsRepositoryImpl extends ProductRepository{
  ApiService apiService;

  ProductsRepositoryImpl(this.apiService);

  @override
  Future<List<Products>> getProducts() async{
    List<Products> products =  await apiService.getAllProducts();
    return products;
  }


  List<Products> getReProducts(List<Products> products, Users user) {
    List<Products>reProducts=[];
      for(int i=0;i<products.length;i++){
         if(products[i].gender == user.gender){
            List<String> weightS= products[i].weight.split(RegExp(r'[-\s]'));
            reProducts.add(products[i]);
         }
      }

    return reProducts;
  }




  @override
  Future<void> addFavourite(String pId,userId)async{
    await apiService.addFav(pId, userId);
  }

  @override
  Future<void> removeFavourite(String pId,String uId)async{
    await apiService.removeFav(pId, uId);
  }

  @override
  Future<List<String>> getFav(String uId)async{
   List<String> fav = await apiService.getFav(uId);
   return fav;
  }

  @override
  Future<Products> getProductById(String pId)async{
     Products p = await apiService.getProductById(pId);
     return p;
  }




}