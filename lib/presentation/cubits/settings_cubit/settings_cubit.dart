import 'dart:io';

import 'package:bloc/bloc.dart';
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
  }
  void pickProfileImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      profileImage = File(image.path);
      emit(PickImageState());
    }
  }
  Future<void> updateUserImage(File? image,String email)async{
    await userRepositoryImpl.updateUserImage(image!, email);
    print('done');
  }
}
