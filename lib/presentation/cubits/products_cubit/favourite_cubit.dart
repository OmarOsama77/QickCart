import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quirkcart/data/repositry/products_repository_impl/products_repository_impl.dart';
import 'package:quirkcart/models/products.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit(this.productsRepositoryImpl) : super(FavouriteInitial());
  ProductsRepositoryImpl productsRepositoryImpl;
  List<String> favourite = [];
  List<Products> fav = [];

  Future<void> addFav(String pId, String uId) async {
    await productsRepositoryImpl.addFavourite(pId, uId);
    favourite.add(pId);
    emit(FavAdeed());
  }

  Future<void> remove(String pId, String uId) async {
    await productsRepositoryImpl.removeFavourite(pId, uId);
    favourite.remove(pId);
    emit(FavRemove());
  }

  Future<List<String>> getAllFav(String uId) async {
    favourite = await productsRepositoryImpl.getFav(uId);
    print('length ${favourite.length}');
    return favourite;
  }

  Future<Products> getProductById(String pId) async {
    Products p = await productsRepositoryImpl.getProductById(pId);
    print('name ${p.name}');
    return p;
  }

  Future<List<Products>> favProduct(List<String> id) async {
    fav.clear();
    for (int i = 0; i < id.length; i++) {
      Products p = await getProductById(id[i]);
      print('ppppp $p');
      fav.add(p);
    }

    emit(FavFetched());
    print('Done ${fav.length}');
    return fav;
  }
}
