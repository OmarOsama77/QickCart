import 'package:quirkcart/domain/repository/user_repositry.dart';
import 'package:quirkcart/models/users.dart';

class SignupUseCase{
  UserRepository userRepository;

  SignupUseCase(this.userRepository);


Future<void> signUp({required Users users, required String email,required String pass,required String confirmPass,required String fName,required String sName ,required String age,required String weight , required String height })async{
    String res = validation(fName, sName, email, pass, confirmPass, age, height, weight);
    print('res = $res');

    if(res =="Success"){
      await userRepository.createEmail(email, pass,users);
    }
}

  String validation(String fName , String sName , String emailId,String password,String confirmPass,String age,String height , String weight){
    if(fName.isEmpty||sName.isEmpty||emailId.isEmpty||password.isEmpty||confirmPass.isEmpty||age.isEmpty||height.isEmpty||weight.isEmpty){
      return "Please Fill all the fields";
    }
    if(password.length<5){
      return "Password must be bigger than 5";
    }
    if(confirmPass!=password){
      return "Passwords are not equal";
    }
    return "Success";

  }

}