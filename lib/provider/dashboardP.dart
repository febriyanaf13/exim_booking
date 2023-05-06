
import 'package:get/get.dart';

import '../api/my_api.dart';

class DashboardProvider extends GetConnect {


// request token
  Future<Response> reqToken(String username, String password) {
    final body = FormData({
      'username': username,
      'password': password,
    });
    return post(Api.TOKEN, body);
  }


}