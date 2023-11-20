import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quirkcart/data/repositry/use_repository_impl/user_repo_impl.dart';
import 'package:quirkcart/models/users.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.userRepositoryImpl) : super(UserInitial());
    UserRepositoryImpl userRepositoryImpl;
    String? _uId;
    List<Users> users = [];
    Users? userData;

  set setUserId(String value) {
    _uId = value;
  }
  String? _uEmail;


  set setUEmail(String value) {
    _uEmail = value;
  }

  Users getUser(List<Users> user){
    print('ca;;ed ');
      userData=userRepositoryImpl.getUserData(users,_uEmail!);
     return userData!;
    }
    Future<List<Users>> getAllUsers ()async{
      print('in cubit');
      users = await userRepositoryImpl.getAllUsers();
      print('Done in cubit');
      getUser(users);
      emit(UsersLoaded());
    return users;
    }


}
