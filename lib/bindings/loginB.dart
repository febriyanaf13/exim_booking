import 'package:get/get.dart';

import '../controllers/loginC.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}
