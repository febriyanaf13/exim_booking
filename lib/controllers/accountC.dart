import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../routes/routes_name.dart';
import '../utils/constants.dart';

class AccountController extends GetxController {
  var version = ''.obs;

  @override
  void onInit() {
    getVersionApp();
    super.onInit();
  }

  void doLogout() {
    Get.dialog(CupertinoAlertDialog(
      title: Text("Logout"),
      actions: [
        CupertinoDialogAction(
            onPressed: () {
              Get.back();
            },
            child: Text("Cancel")),
        CupertinoDialogAction(
            onPressed: () async {
              await storage.remove('userData');
              Get.offNamed(
                Routes.login,
              );
            },
            child: Text("OK")),
      ],
      content: Text("Apakah anda yakin ingin keluar?"),
    ));
  }

  void getVersionApp() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    version.value = packageInfo.version;
  }
}
