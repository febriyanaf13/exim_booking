import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ketech_booking/model/invoice.dart';
import 'package:ketech_booking/provider/invoiceP.dart';

import '../components/custom_snackbar.dart';
import '../utils/constants.dart';

class InvoiceController extends GetxController {
  var userData = storage.read('userData');
  String searchInvoice = '';
  var listInvoice = <Invoice>[].obs;

  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getInvoice();
    });
    super.onInit();
  }

  void getInvoice() {
    InvoiceProvider()
        .getInvoice(userData['userid'], searchInvoice)
        .then((value) {
      if (value.statusCode == 200) {
        var jsonResponse = value.body;
        var status = jsonResponse['status'];
        var success = jsonResponse['success'];
        var message = jsonResponse['message'];
        if (status == null) {
          if (success) {
            var jsonIsi = jsonResponse['isi'];
            var jsonData = invoiceFromJson(jsonIsi['data']);
            listInvoice(jsonData);
          } else {
            snackbarWarning('Opss... ', '$message');
          }
        } else {
          snackbarWarning('Opss... ', '$status');
        }
      } else {
        snackbarError(
            'List Schedule Error  ${value.statusCode}', '${value.statusText}');
      }
      return;
    });
  }
}
