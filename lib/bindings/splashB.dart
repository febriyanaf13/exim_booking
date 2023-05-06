import 'package:get/get.dart';

import '../controllers/splashC.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
