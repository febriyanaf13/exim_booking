import 'package:get/get.dart';
import 'package:ketech_booking/controllers/partiesC.dart';
import 'package:ketech_booking/controllers/shipmentC.dart';

import '../controllers/bookingC.dart';

class BookingBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(BookingController());
    Get.put(ShipmentController());
    Get.put(PartiesController());
  }
}
