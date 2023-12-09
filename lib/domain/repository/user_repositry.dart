import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:quirkcart/models/users.dart';

abstract class UserRepository{
  Future<UserCredential> signInWithEmailAndPassword(String email , String password);
  Future<void> createEmail(String email,String password,Users users);
  Future<Users>  getUserData(List<Users> user,String uEmail);
  Future<List<Users>> getAllUsers();
  Future<void>uploadUserImg(File image, String userEmail);
  Future<void>logOut();
  Future<void>updateUserImage(File image,String userEmail);
  Future<void>updateUserData(String userId,String fName,String sName,String address);
}