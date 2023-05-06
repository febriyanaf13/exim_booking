// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ketech_booking/model/commodity.dart';
import 'package:ketech_booking/model/simpan_booking.dart';
import '../components/custom_snackbar.dart';
import '../model/carrier.dart';
import '../model/kota.dart';
import '../model/schedule.dart';
import '../model/transport.dart';
import '../provider/bookingP.dart';
import '../routes/routes_name.dart';
import '../utils/constants.dart';

class BookingController extends GetxController {
  var token = storage.read('token');
  var tokenLogin = storage.read('token_login');

  var listTransportMode = <TransportMode>[].obs;
  var listKota = <ListKota>[].obs;
  var listCarrier = <Carriers>[].obs;
  var listSchedule = <Schedule>[].obs;
  var listCommodity = <ListCommodity>[].obs;
  var statusQuotation = false.obs;
  var statusServiceMode = false.obs;
  var quotationEditingController;
  var serviceModeOriginTextEditingController;
  var serviceModeDepartureTextEditingController;

  var ranngeDate = 0.obs;
  String arrivalDate = '';

  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getListKota();
      getTransportMode();
      getCarriers();
      getCommodity();
      quotationEditingController = TextEditingController();
      serviceModeOriginTextEditingController = TextEditingController();
      serviceModeDepartureTextEditingController = TextEditingController();
    });

    super.onInit();
  }

  void getTransportMode() {
    BookingProvider().getListTransportMode(token).then((value) {
      if (value.statusCode == 200) {
        var jsonResponse = value.body;
        var success = jsonResponse['success'];
        var message = jsonResponse['message'];
        if (success != null) {
          if (success) {
            var jsonData = transportModeFromJson(jsonResponse['data']);
            listTransportMode(jsonData);
          } else {
            snackbarWarning('Opss... ', '$message');
          }
        } else {
          var status = jsonResponse['status'];

          snackbarWarning('$status', '${value.statusText}');
        }
      } else {
        snackbarError(
            'Transprt Error  ${value.statusCode}', '${value.statusText}');
      }
      return;
    });
  }

  void getListKota() {
    BookingProvider().getListKota(token).then((value) {
      if (value.statusCode == 200) {
        var jsonResponse = value.body;
        var success = jsonResponse['success'];
        var message = jsonResponse['message'];
        if (success != null) {
          if (success) {
            var jsonData = listKotaFromJson(jsonResponse['data']);
            listKota(jsonData);
          } else {
            snackbarWarning('Opss... ', '$message');
          }
        } else {
          snackbarError(
              'List Kota Error  ${value.statusCode}', '${value.statusText}');
        }
      }
      return;
    });
  }

  void getSchedule(String loading, String discharge, String date,
      String dateEnd, String transportMode, String cariier) {
    DateTime delivery = DateTime.parse(date);
    DateTime arrived = DateTime.parse(dateEnd);

    final DateTime dateFrom =
        DateTime(delivery.year, delivery.month, delivery.day);
    final DateTime dateTo = DateTime(arrived.year, arrived.month, arrived.day);

    final Duration duration = dateTo.difference(dateFrom);
    var range = duration.inDays;
    print("$range days");

    var data = {
      'loading': loading,
      'discharge': discharge,
      'date': date,
      'date_end': dateEnd,
      'transport_mode': transportMode,
      'carriers': cariier,
    };
    var arg = {
      'quotation': statusQuotation.isTrue? quotationEditingController.text : '',
      'smOrigin': statusServiceMode.isTrue ? serviceModeOriginTextEditingController.text : '',
      'smDeparture': statusServiceMode.isTrue ? serviceModeDepartureTextEditingController.text : '',
    
    };
    // print(data);

    BookingProvider().getListSchedule(token, data).then((value) {
      if (value.statusCode == 200) {
        var jsonResponse = value.body;
        var success = jsonResponse['success'];
        var message = jsonResponse['message'];
        if (success) {
          var jsonIsi = jsonResponse['isi'];
          var jsonData = scheduleFromJson(jsonIsi['data']);
          listSchedule(jsonData);
          // print(jsonIsi);
          Get.toNamed(Routes.cargoSchedule, arguments: arg);
        } else {
          snackbarWarning('Opss... ', '$message');
        }
      } else {
        snackbarError(
            'List Schedule Error  ${value.statusCode}', '${value.statusText}');
      }
      return;
    });
  }

  void getCarriers() {
    BookingProvider().getListCarrier(token).then((value) {
      if (value.statusCode == 200) {
        var jsonResponse = value.body;
        var success = jsonResponse['success'];
        var message = jsonResponse['message'];
        if (success) {
          var jsonData = carriersFromJson(jsonResponse['data']);
          listCarrier(jsonData).toList().map((e) => e.toString()).toList();
        } else {
          snackbarWarning('Opss... ', '$message');
        }
      } else {
        snackbarError(
            'List Carrier  ${value.statusCode}', '${value.statusText}');
      }
      return;
    });
  }

  void getCommodity() {
    BookingProvider().getListCommodity(token).then((value) {
      if (value.statusCode == 200) {
        var jsonResponse = value.body;
        var success = jsonResponse['success'];
        var message = jsonResponse['message'];
        if (success) {
          var jsonData = commodityFromJson(jsonResponse['data']);
          listCommodity(jsonData);
        } else {
          snackbarWarning('Opss... ', '$message');
        }
      } else {
        snackbarError(
            'List Commodity  ${value.statusCode}', '${value.statusText}');
      }
      return;
    });
  }

  void simpanBooking(data) {
    final body = simpanBookingToJson(SimpanBooking(
      userId: data['user_id'],
      transportMode: data['transport_mode'],
      quotationNumber: data['quotation_number'],
      portLoading: data['port_loading'],
      portDischarge: data['port_discharge'],
      smOrigin: data['sm_origin'],
      smDeparture: data['sm_departure'],
      dateDeparture: DateTime.parse(data['date_departure']),
      dateArrival: DateTime.parse(data['date_arrival']),
      metric: data['metric'],
      fcllcl: data['fcllcl'],
      scheduleId: data['schedule_id'],
      shipper: data['shipper'],
      consignee: data['consignee'],
      notifyParty: data['notify_party'],
      carrier: data['carrier'],
      bookingParty: "0",
      paymentType: data['payment_type'],
      paymentLocation: data['payment_location'],
      notes: data['notes'],
      specialHandling: data['special_handling'],
      cargoPickup: data['cargo_pickup'],
      cargoDelivery: data['cargo_delivery'],
      cargoInsurance: data['cargo_insurance'],
      portFee: data['port_fee'],
      customClearance: data["custom_clearance"],
      commodities: data['commodities'],
      fcl: data['fcllcl'] == 'FCL' ? data['listfcllcl']! : [],
      lcl: data['fcllcl'] == 'LCL' ? data['listfcllcl']! : [],
    ));
    print(body);
    BookingProvider()
        .simpanBooking(body, tokenLogin)
        .then((value) => print(value.body));
  }
}
