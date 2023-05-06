import 'package:get/get.dart';

import '../controllers/accountC.dart';

class AccountBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AccountController());
  }
}
