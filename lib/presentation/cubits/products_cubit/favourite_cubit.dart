import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quirkcart/data/repositry/products_repository_impl/products_repository_impl.dart';
import 'package:quirkcart/models/products.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit(this.productsRepositoryImpl) : super(FavouriteInitial());
  ProductsRepositoryImpl productsRepositoryImpl;
  Set<String> fav = {};
  List<Products> favProducts = [];

  Future<Set<String>> getFavourite(String uId) async {
    fav = await productsRepositoryImpl.getFav(uId);
    List<String> favList = fav.toList();
    for (int i = 0; i < favList.length; i++) {
      int c = int.parse(favList[i]) - 1;
      favList[i] = c.toString();
    }
    fav = favList.toSet();
    print('fav = $fav');
    return fav;
  }

  Future<void> addFavourite(String uId, String pId,Products product) async {
    bool added = fav.add(pId);
    if(added){
      // Products p = await getProduct(product.toString());
      favProducts.add(product);
      print('added');
    }else{
      print('not');
    }

    await productsRepositoryImpl.addFav(uId, pId);
    emit(FavAdded());
  }

  Future<void> removeFav(String uId, String pId,String name) async {
    await productsRepositoryImpl.removeFav(uId, pId);
    for (int i = 0; i < favProducts.length; i++) {
      int c = int.parse(pId)-1;
      if (favProducts[i].name == name) {

        favProducts.removeAt(i);
        emit(FavRemoved());
        break;
      }
    }
    emit(FavRemoved());
  }

  Future<List<Products>> getProductById() async {
    for (int i = 0; i < fav.length; i++) {
      print('fav ${fav.elementAt(i)}');
      Products p =
          await productsRepositoryImpl.getProductById(fav.elementAt(i));
      print(' p= ${p.name}');
      favProducts.add(p);
    }
    return favProducts;
  }

  Future<Products> getProduct(String pId) async {
    Products p = await productsRepositoryImpl.getProductById(pId);
    return p;
  }
  void changeFavIcon(List<Products>p,int id){
      for (int i=0;i<p.length;i++){
        if(p[i].id==id){
          p[i].fav=null;
        }
      }
  }
}
