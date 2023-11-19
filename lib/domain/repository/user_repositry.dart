import 'package:quirkcart/models/users.dart';

abstract class UserRepository{
  Future<void> signInWithEmailAndPassword(String email , String password);
  Future<void> createEmail(String email , String password,Users users);

}