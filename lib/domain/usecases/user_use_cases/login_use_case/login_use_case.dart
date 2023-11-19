
import 'package:quirkcart/domain/repository/user_repositry.dart';

class LoginUseCase{
  UserRepository userRepository;

  LoginUseCase(this.userRepository);

  Future<void> login(String email ,String password)async{
    String res = validation(email, password);
      if(res == "Success"){
        await userRepository.signInWithEmailAndPassword(email, password);
      }
  }

  String validation(String email ,String password){
    if(email.isEmpty || password.isEmpty){
      return "Fields can't be empty";
    }
    if(password.length<5){
      return "Password mus be bigger than 5";
    }
    return "Success";
  }
}