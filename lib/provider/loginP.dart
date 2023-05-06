import 'package:get/get_connect/connect.dart';

import '../api/my_api.dart';

class LoginProvider extends GetConnect {

   // request token
  Future<Response> reqTokenLogin(String username, String password) {
    final body = FormData({
      'username': username,
      'password': password,
    });
    return post(Api.TOKEN_LOGIN, body);
  }



  // request login
  Future<Response> checkLogin(String username, String password, String token) {
    var headers = {
      "Authorization": "Bearer " + token,
    };
    final body = FormData({
      'username': username,
      'password': password,
    });
    return post(Api.LOGIN, body, headers: headers);
  }
}
