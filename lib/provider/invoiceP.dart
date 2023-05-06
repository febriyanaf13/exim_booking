import 'package:get/get.dart';
import 'package:ketech_booking/api/my_api.dart';
import 'package:ketech_booking/utils/constants.dart';

class InvoiceProvider extends GetConnect {
  var token = storage.read('token');
// Get invoice
  Future<Response> getInvoice(int id, String search) {
    var headers = {
      "Authorization": "Bearer " + token,
    };
    return get(Api.LIST_INVOICE + '/$id',
        headers: headers, query: {search: search});
  }
}
