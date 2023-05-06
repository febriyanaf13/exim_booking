import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'bindings/splashB.dart';
import 'routes/app_pages.dart';
import 'routes/routes_name.dart';
import 'theme/app_theme.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Get.testMode = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splash,
      initialBinding: SplashBinding(),
      theme: appThemeData,
      defaultTransition: Transition.fade,
      getPages: AppPages.pages,
    );
  }
}
