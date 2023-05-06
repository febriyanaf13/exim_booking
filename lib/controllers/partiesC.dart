import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ketech_booking/model/shipper.dart';

import '../components/custom_snackbar.dart';
import '../provider/bookingP.dart';
import '../utils/constants.dart';

class PartiesController extends GetxController {
  var token = storage.read('token');
  var listShipper = <Shipper>[].obs;

  late TextEditingController shipperEditingController;
  late TextEditingController consigneeEditingController;
  late TextEditingController notifyPartyEditingController;
  late TextEditingController paymentEditingController;
  late TextEditingController paymentLocationEditingController;
  late TextEditingController notesEditingController;

  @override
  void onInit() {
    shipperEditingController = TextEditingController();
    consigneeEditingController = TextEditingController();
    notifyPartyEditingController = TextEditingController();
    paymentEditingController = TextEditingController();
    paymentLocationEditingController = TextEditingController();
    notesEditingController = TextEditingController();

    getListShipper();
    super.onInit();
  }

  void getListShipper() {
    BookingProvider().getListShipper(token).then((value) {
      if (value.statusCode == 200) {
        var jsonResponse = value.body;
        var success = jsonResponse['success'];
        var message = jsonResponse['message'];
        if (success != null) {
          if (success) {
            var jsonData = shipperFromJson(jsonResponse['data']);
            listShipper(jsonData);
          } else {
            snackbarWarning('Opss... ', '$message');
          }
        } else {
          var status = jsonResponse['status'];

          snackbarWarning('Opss... ', '$status');
        }
      } else {
        snackbarError(
            'List Shipper Error  ${value.statusCode}', '${value.statusText}');
      }
      return;
    });
  }
}
