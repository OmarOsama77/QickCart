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

  Future<Users> getUser(List<Users> user)async{
    userData=await userRepositoryImpl.getUserData(users,_uEmail!);
     return userData!;
    }
    Future<List<Users>> getAllUsers ()async{
      users = await userRepositoryImpl.getAllUsers();
      getUser(users);
      emit(UsersLoaded());
    return users;
    }


}
