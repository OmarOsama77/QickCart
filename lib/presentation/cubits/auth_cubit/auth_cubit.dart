import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:quirkcart/domain/usecases/user_use_cases/login_use_case/login_use_case.dart';
import 'package:quirkcart/domain/usecases/user_use_cases/login_use_case/signup_use_case.dart';
import 'package:quirkcart/models/users.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.loginUseCase,this.signupUseCase) : super(AuthInitial());
  LoginUseCase loginUseCase;
  SignupUseCase signupUseCase;
  bool male=false;
  bool loading=false;
  bool female = false;
  String? gender;
  void chooseMale(){
    male = true;
    female = false;
    gender = "male";
    emit(MaleGender());
    emit(FemaleGender());

  }
  void chooseFemale(){
    male = false;
    female = true;
    gender = "female";
    emit(MaleGender());
    emit(FemaleGender());
  }



  Future<UserCredential?> login(String email ,String password)async{
      try{
        loading = true;
        emit(loginLoading());
         UserCredential userCredential =await loginUseCase.login(email, password);
        emit(loginSuccess());
        loading = false;
        return userCredential;
      }catch(e){
        emit(loginFailed(e.toString()));
        return null;
      }
  }
  Future<void> signUp(String email ,String pass,String fName,String sName ,String password,String confirmPass,String age,String height,String weight,Users users)async{
    try{
      loading = true;
      emit(SignupLoading());
       signupUseCase.signUp(email: email, pass: pass, confirmPass: confirmPass, fName: fName, sName: sName, age: age, weight: weight, height: height,users: users);
      loading = false;
       emit(SignupSuccess());

    }catch(e){
      loading = false;
      emit(SignupFailed(e.toString()));
    }
  }

}
