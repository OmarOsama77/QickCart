import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quirkcart/domain/repository/user_repositry.dart';

class LoginUseCase{
  UserRepository userRepository;

  LoginUseCase(this.userRepository);

  Future<UserCredential> login(String email ,String password)async{
    email = email.trim();
    String res = validation(email, password);
      if(res == "Success"){
        UserCredential userCredential = await userRepository.signInWithEmailAndPassword(email, password);
        return userCredential;
      }
      throw Exception("Error in login use case");
  }

  String validation(String email ,String password){
    if(email.isEmpty || password.isEmpty){
      Fluttertoast.showToast(msg: "Fields can't be empty");
      return "Fields can't be empty";
    }
    if(password.length<5){
      Fluttertoast.showToast(msg: "Password mus be bigger than 5");
      return "Password mus be bigger than 5";
    }
    return "Success";
  }
}