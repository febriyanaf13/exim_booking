import 'package:get/get.dart';
import 'package:ketech_booking/controllers/commodityC.dart';

class CommodityBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CommodityController());
  }
}
