
import 'package:get/get.dart';

import '../api/my_api.dart';

class BookingProvider extends GetConnect {
  Future<Response> getListSchedule(String token, Map data) {
    var headers = {
      "Authorization": "Bearer " + token,
    };
    return post(Api.LIST_SCHEDULE, data, headers: headers);
  }

  Future<Response> getListTransportMode(String token) {
    var headers = {
      "Authorization": "Bearer " + token,
    };
    return get(Api.TRANSPORT_MODE, headers: headers);
  }

  Future<Response> getListCarrier(String token) {
    var headers = {
      "Authorization": "Bearer " + token,
    };
    return get(Api.LIST_CARRIER, headers: headers);
  }

  Future<Response> getListKota(String token) {
    var headers = {
      "Authorization": "Bearer " + token,
    };
    return get(Api.LIST_KOTA, headers: headers);
  }

  Future<Response> getListCommodity(String token) {
    var headers = {
      "Authorization": "Bearer " + token,
    };
    return get(Api.LIST_COMMODITY, headers: headers);
  }

  Future<Response> getListContainer(String token) {
    var headers = {
      "Authorization": "Bearer " + token,
    };
    return get(Api.LIST_CONTAINER, headers: headers);
  }

  Future<Response> getListPackaging(String token) {
    var headers = {
      "Authorization": "Bearer " + token,
    };
    return get(Api.LIST_PACKAGING, headers: headers);
  }

  Future<Response> getListShipper(String token) {
    var headers = {
      "Authorization": "Bearer " + token,
    };
    return get(Api.LIST_SHIPPER, headers: headers);
  }

  // simpan Booking
  Future<Response> simpanBooking(body, String token) {
    var headers = {
      "Authorization": "Bearer " + token,
    };
   
    return post(Api.SIMPAN_BOOKING, body, headers: headers);
  }
}
