import 'package:todo/base/user_base.dart';
import 'package:todo/helper/locator.dart';
import 'package:todo/model/user_model.dart';
import 'package:todo/service/base/user_service_base.dart';
import 'package:todo/service/user_service.dart';

class UserRepository implements UserBase {
  UserService _service = locator<UserApiService>();

  @override
  Future<List<UserModel?>> getAllUser() async {
    return await _service.getAllUser();
  }

  @override
  Future<UserModel?> getUser() async {
    return await _service.getUser();
  }
}
