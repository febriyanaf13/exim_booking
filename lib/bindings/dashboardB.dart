import 'package:get/get.dart';

import '../controllers/dashboarC.dart';

class DashboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController());
  }
}
