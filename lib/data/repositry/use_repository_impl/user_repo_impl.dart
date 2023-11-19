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
  Future<void> signInWithEmailAndPassword(String email, String password) async{
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    }catch(e){
      throw e.toString();
    }
  }
  
}