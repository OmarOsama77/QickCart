import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:quirkcart/data/repositry/use_repository_impl/user_repo_impl.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit(this.userRepositoryImpl) : super(SettingsInitial());
  UserRepositoryImpl userRepositoryImpl;
  File? profileImage;



  Future<void>updateUserData(String userId,String fName,String sName,String address)async{
    await userRepositoryImpl.updateUserData(userId, fName, sName, address);
    emit(UserDataChanged());
  }
  void pickProfileImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      profileImage = File(image.path);
      emit(PickImageState());
    }
  }
  Future<String> updateUserImage(File image,String email)async{
    try{
      final storageReference = FirebaseStorage.instance.ref().child('profile_images/$email');
      final UploadTask uploadTask = storageReference.putFile(image);
      final TaskSnapshot snapshot = await uploadTask;
      String imageURL = await storageReference.getDownloadURL();
      return imageURL;
    }catch(e){
      throw e.toString();
    }
  }
}
