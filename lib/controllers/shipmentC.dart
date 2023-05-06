// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ketech_booking/model/container.dart';
import 'package:ketech_booking/model/list_shipment_booking.dart';
import 'package:ketech_booking/model/packaging.dart';
import 'package:ketech_booking/provider/bookingP.dart';

import '../components/custom_snackbar.dart';
import '../model/simpan_booking.dart';
import '../utils/constants.dart';

class ShipmentController extends GetxController {
  var statusFCLLCL = false.obs;
  var statusMatric = false.obs;
  var statusCargoPickup = false.obs;
  var statusCargoDelivery = false.obs;
  var statusCargoIncurance = false.obs;
  var statusPFFF = false.obs;
  var statusCustomClearances = false.obs;
  var satuanWeight = ''.obs;
  var satuanMeas = ''.obs;
  var satuanDimension = ''.obs;
  var listContainer = <ListContainer>[].obs;
  var listPackaging = <Packaging>[].obs;
  var listShipmentBookingFCL = <ListShipmentBooking>[].obs;
  var listShipmentBookingLCL = <ListShipmentBooking>[].obs;
  var listFCL = <Fcl>[].obs;
  var listLCL = <Lcl>[].obs;

  var token = storage.read('token');

  int idFCL = 0;
  int idLCL = 0;
  var containerType = ''.obs;
  var grossWeight = ''.obs;
  var height = ''.obs;
  var length = ''.obs;
  var meas = ''.obs;
  var netWeight = ''.obs;
  var packaging = ''.obs;
  var qty = ''.obs;
  var width = ''.obs;

  late TextEditingController containerTypeEditingController;
  late TextEditingController sizeEditingController;
  late TextEditingController grossWeightEditingController;
  late TextEditingController netWeightEditingController;
  late TextEditingController qtyEditingController;
  late TextEditingController lengthEditingController;
  late TextEditingController packagingEditingController;
  late TextEditingController widthEditingController;
  late TextEditingController heightEditingController;
  late TextEditingController measEditingController;
  late TextEditingController cargoPickupTypeEditingController;
  late TextEditingController cargoDeliveryEditingController;
  late TextEditingController cargoInsuranceEditingController;
  late TextEditingController portFeeEditingController;
  late TextEditingController customClearanceEditingController;
  late TextEditingController specialHandlingEditingController;

  @override
  void onInit() {
    containerTypeEditingController = TextEditingController();
    sizeEditingController = TextEditingController();
    grossWeightEditingController = TextEditingController();
    netWeightEditingController = TextEditingController();
    qtyEditingController = TextEditingController();
    lengthEditingController = TextEditingController();
    packagingEditingController = TextEditingController();
    widthEditingController = TextEditingController();
    heightEditingController = TextEditingController();
    measEditingController = TextEditingController();
    cargoPickupTypeEditingController = TextEditingController();
    cargoDeliveryEditingController = TextEditingController();
    cargoInsuranceEditingController = TextEditingController();
    portFeeEditingController = TextEditingController();
    customClearanceEditingController = TextEditingController();
    specialHandlingEditingController = TextEditingController();

    getListContainer();
    getListPackaging();
    super.onInit();
  }

  void addListShipmentDetailsFCL() {
    listShipmentBookingFCL.add(ListShipmentBooking(
      id: idFCL,
      statusMatric: statusMatric.value,
      containerType: containerTypeEditingController.text,
      grossWeight: grossWeightEditingController.text,
      meas: measEditingController.text,
      netWeight: netWeightEditingController.text,
      qty: qtyEditingController.text,
    ));
    listFCL.add(Fcl(
        size: sizeEditingController.text,
        grossWeight: grossWeightEditingController.text,
        meas: measEditingController.text,
        netWeight: netWeightEditingController.text,
        qty: qtyEditingController.text));
    idFCL++;
  }

  void addListShipmentDetailsLCL() {
    listShipmentBookingLCL.add(ListShipmentBooking(
      id: idLCL,
      statusMatric: statusMatric.value,
      containerType: packagingEditingController.text,
      grossWeight: grossWeightEditingController.text,
      height: heightEditingController.text,
      length: lengthEditingController.text,
      packaging: lengthEditingController.text,
      qty: qtyEditingController.text,
      width: widthEditingController.text,
    ));

    listLCL.add(Lcl(
        grossWeight: grossWeightEditingController.text,
        height: grossWeightEditingController.text,
        length: lengthEditingController.text,
        packaging: packagingEditingController.text,
        qty: qtyEditingController.text,
        width: widthEditingController.text));
    idLCL++;
  }

  ListShipmentBooking listShipmentBookingLCLById(String id) {
    return listShipmentBookingLCL.firstWhere((element) => element.id == id);
  }

  ListShipmentBooking listShipmentBookingFCLById(String id) {
    return listShipmentBookingFCL.firstWhere((element) => element.id == id);
  }

  Future<bool> deleteListShipmentBookingFCL(int id) async {
    bool _deleted = false;
    await Get.dialog(CupertinoAlertDialog(
      title: Text("DELETE"),
      actions: [
        CupertinoDialogAction(
            onPressed: () {
              Get.back();
            },
            child: Text("Cancel")),
        CupertinoDialogAction(
            onPressed: () async {
              listShipmentBookingFCL.removeWhere((element) => element.id == id);
              _deleted = true;
              Get.back();
            },
            child: Text("OK")),
      ],
      content: Text("Apakah kamu yakin untuk menghapus data ini??"),
    ));

    return _deleted;
  }

  Future<bool> deleteListShipmentBookingLCL(int id) async {
    bool _deleted = false;
    await Get.dialog(CupertinoAlertDialog(
      title: Text("DELETE"),
      actions: [
        CupertinoDialogAction(
            onPressed: () {
              Get.back();
            },
            child: Text("Cancel")),
        CupertinoDialogAction(
            onPressed: () async {
              listShipmentBookingLCL.removeWhere((element) => element.id == id);
              _deleted = true;
              Get.back();
            },
            child: Text("OK")),
      ],
      content: Text("Apakah kamu yakin untuk menghapus data ini??"),
    ));

    return _deleted;
  }

  void getListContainer() {
    BookingProvider().getListContainer(token).then((value) {
      if (value.statusCode == 200) {
        var jsonResponse = value.body;
        var success = jsonResponse['success'];
        var message = jsonResponse['message'];
        if (success != null) {
          if (success) {
            var jsonData = listContainerFromJson(jsonResponse['data']);
            listContainer(jsonData);
          } else {
            snackbarWarning('Opss... ', '$message');
          }
        } else {
          var status = jsonResponse['status'];

          snackbarWarning('Opss... ', '$status');
        }
      } else {
        snackbarError(
            'List Container Error  ${value.statusCode}', '${value.statusText}');
      }
      return;
    });
  }

  void getListPackaging() {
    BookingProvider().getListPackaging(token).then((value) {
      if (value.statusCode == 200) {
        var jsonResponse = value.body;
        var success = jsonResponse['success'];
        var message = jsonResponse['message'];
        if (success != null) {
          if (success) {
            var jsonData = packagingFromJson(jsonResponse['data']);
            listPackaging(jsonData);
          } else {
            snackbarWarning('Opss... ', '$message');
          }
        } else {
          var status = jsonResponse['status'];

          snackbarWarning('Opss... ', '$status');
        }
      } else {
        snackbarError(
            'List Container Error  ${value.statusCode}', '${value.statusText}');
      }
      return;
    });
  }
}
