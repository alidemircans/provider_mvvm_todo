import 'package:todo/helper/constants.dart';
import 'package:todo/model/user_model.dart';
import 'package:todo/service/base/user_service_base.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserApiService implements UserService {
    String _baseUrl = Constants.USER_LIST_API_URL;

  @override
  Future<List<UserModel?>> getAllUser()async {
   List<UserModel?> users = [];
    try {
      Uri uri = Uri.parse(_baseUrl);
      var response = await http.get(
        uri,
        headers: Constants.getDefaultHeaders(),
      );

      if (response.statusCode == 200) {
        var result = json.decode(response.body);
        for (var user in result) {
          users.add(UserModel.fromJson(user));
        }
      } else {
        print(
            "UserApiService /getAllUser APICALLERROR=> ${response.statusCode}");
      }
    } catch (e) {
      print("UserApiService /getAllUser $e ");
    }
    return users;
  }

  @override
  Future<UserModel?> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }
}
