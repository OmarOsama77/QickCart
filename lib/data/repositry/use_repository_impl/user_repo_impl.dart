import 'package:firebase_auth/firebase_auth.dart';
import 'package:quirkcart/data/network/api_service.dart';
import 'package:quirkcart/domain/repository/user_repositry.dart';
import 'package:quirkcart/models/users.dart';


class UserRepositoryImpl extends UserRepository{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final ApiService apiService;

  UserRepositoryImpl(this.apiService);

  @override
  Future<void> createEmail(String email, String password,Users users) async{
    print('Signing in with email: $email, password: $password');
     try{
          await _auth.createUserWithEmailAndPassword(email: email, password: password);
          await apiService.uploadUserData(users);
     }catch(e){
       print('Error during sign-in: $e');
       throw e.toString();
     }
  }

  @override
  Future<UserCredential> signInWithEmailAndPassword(String email, String password) async{
    try{
      UserCredential userCredential =  await _auth.signInWithEmailAndPassword(email: email, password: password);


      return userCredential;
    }catch(e){
      throw e.toString();
    }
  }

  @override
  Future<List<Users>> getAllUsers() async{
    print('in repo');
    List<Users>users = await apiService.getAllUsers();
     print('Dione in repooo');
    return users;
  }

  @override
  Users getUserData(List<Users> user, String uEmail) {
    Users? userData;
    for (int i=0;i<user.length;i++){
      if(user[i].email == uEmail){
        userData = user[i];
        return userData;
      }
    }
    throw Exception('User not found');
  }



  
}