import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:quirkcart/data/repositry/use_repository_impl/user_repo_impl.dart';
import 'package:quirkcart/domain/usecases/user_use_cases/login_use_case/login_use_case.dart';
import 'package:quirkcart/domain/usecases/user_use_cases/login_use_case/signup_use_case.dart';
import 'package:quirkcart/models/users.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.loginUseCase,this.signupUseCase,this.userRepositoryImpl) : super(AuthInitial());
  LoginUseCase loginUseCase;
  SignupUseCase signupUseCase;
  UserRepositoryImpl userRepositoryImpl;
  bool loginIndicator=false;
  bool signUpIndicator=false;
  bool male=false;
  bool female = false;
  String? gender;
  File? profileImage;
  void chooseMale(){
    male = true;
    female = false;
    gender = "male";
    emit(MaleGender());
    emit(FemaleGender());

  }
  void pickProfileImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      profileImage = File(image.path);
      emit(PickImageState());
    }
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
        loginIndicator = true;
        emit(loginLoading());
         UserCredential userCredential =await loginUseCase.login(email, password);
        emit(loginSuccess());
        loginIndicator = false;
        return userCredential;
      }catch(e){
        emit(loginFailed(e.toString()));
        return null;
      }
  }
  Future<void> signUp(String email ,String pass,String fName,String sName ,String password,String confirmPass,String age,String height,String weight,Users users)async{
    try{
      signUpIndicator = true;
      emit(SignupLoading());
       signupUseCase.signUp(email: email, pass: pass, confirmPass: confirmPass, fName: fName, sName: sName, age: age, weight: weight, height: height,users: users);
      signUpIndicator = false;
       emit(SignupSuccess());
      Fluttertoast.showToast(msg: "Registration successful for $email");
    }catch(e){
      signUpIndicator = false;
      emit(SignupFailed(e.toString()));
    }
  }
  Future<void>uploadUserImage(File image, String userEmail)async{
    await  userRepositoryImpl.uploadUserImg(image, userEmail);
  }

}
