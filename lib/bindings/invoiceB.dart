import 'package:get/get.dart';
import 'package:ketech_booking/controllers/invoiceC.dart';

class InvoiceBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(InvoiceController());
  }
}
