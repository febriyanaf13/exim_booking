// ignore_for_file: avoid_print

import 'package:get/get.dart';

import '../components/custom_snackbar.dart';
import '../provider/dashboardP.dart';
import '../provider/loginP.dart';
import '../routes/routes_name.dart';
import '../utils/constants.dart';

class SplashController extends GetxController {
  var user = storage.read('userData');
  var session = storage.read('session');
  @override
  void onInit() {
    Future.delayed(Duration(seconds: 3), () => getTokenLogin());
    super.onInit();
  }

  void getTokenLogin() {
    LoginProvider().reqTokenLogin('febri', 'febrimobile150708').then((value) {
      print('status_code token_login : ${value.statusCode}');
      if (value.statusCode == 200) {
        print('token_login : ${value.body['token']}');

        storage.write('token_login', value.body['token']);
        getToken();
        autoLogin();
      } else {
        snackbarError('Error ${value.statusCode}', '${value.statusText}');
      }
      return;
    });
  }

  void getToken() {
    DashboardProvider().reqToken('febri', 'febrimobile150708').then((value) {
      print('status_code token : ${value.statusCode}');
      print('token : ${value.body['token']}');
      if (value.statusCode == 200) {
        storage.write('token', value.body['token']);
      } else {
        snackbarError('Token Error ${value.statusCode}', '${value.statusText}');
      }
      return;
    });
  }

  void autoLogin() {
    if (session != null) {
      if (user != null) {
        Get.offNamed(Routes.dashboard);
      } else {
        Get.offNamed(Routes.login);
      }
    } else {
      Get.offNamed(Routes.welcome);
    }
  }
}
