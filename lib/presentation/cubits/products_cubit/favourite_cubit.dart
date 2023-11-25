import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quirkcart/models/products.dart';
import '../../../domain/repository/product_repository.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit(this.productRepository) : super(FavouriteInitial());
  ProductRepository productRepository;
  Set<String> fav={};
  List<Products>favProducts=[];
  Future<Set<String>> getFav(String uId)async{
    fav = await productRepository.getFav(uId);
    return fav;
  }
  Future<void> addFav(String uId,String pId)async{
    await productRepository.addFav(uId, pId);
    emit(FavAdded());
  }
 Future<Products> getProductById(String pId)async{
   Products p = await productRepository.getProductById(pId);
    return p;
 }
 Future<List<Products>> getFavProducts(Set<String> fav)async{
    for(int i=0;i<fav.length;i++){
      Products p =await getProductById(fav.elementAt(i));
      favProducts.add(p);
    }

    return favProducts;
 }

}
