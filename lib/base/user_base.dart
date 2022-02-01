import 'package:todo/model/user_model.dart';

abstract class UserBase {
  Future<UserModel?> getUser();
  Future<List<UserModel?>> getAllUser();

}
