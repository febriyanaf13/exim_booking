// ignore_for_file: file_names
import 'package:get/get.dart';

import '../components/custom_snackbar.dart';
import '../model/user.dart';
import '../provider/loginP.dart';
import '../routes/routes_name.dart';
import '../utils/constants.dart';

class LoginController extends GetxController {
  var token = storage.read('token_login');
  var obscureText = true.obs;

  void fetchLogin(String username, String password) {
    LoginProvider().checkLogin(username, password, token).then((value) {
      if (value.statusCode == 200) {
        var jsonResponse = value.body;
        var success = jsonResponse['success'];
        var message = jsonResponse['message'];
        if (success != null) {
          if (success) {
            var jsonData = userFromJson(jsonResponse['data']);
            storage.write('userData', {
              'userid': jsonData[0].userid,
              'username': jsonData[0].username,
              'nama': jsonData[0].nama,
              'email': jsonData[0].email,
              'telepon': jsonData[0].telepon,
              'initial': jsonData[0].initial,
              'cabangid': jsonData[0].cabangid,
              'nama_cabang': jsonData[0].namaCabang,
              'nama_perusahaan': jsonData[0].namaPerusahaan,
            });
            storage.write('session', true);

            Get.toNamed(Routes.dashboard);
          } else {
            snackbarWarning('Opss... ', '$message');
          }
        } else {
          var status = jsonResponse['status'];

          snackbarWarning('$status', '${value.statusText}');
        }
      } else {
        snackbarError('Error ${value.statusCode}', '${value.statusText}');
      }
      return;
    });
  }
}
