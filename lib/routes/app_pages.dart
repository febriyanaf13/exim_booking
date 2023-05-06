import 'package:ketech_booking/bindings/accountB.dart';
import 'package:ketech_booking/bindings/commodityB.dart';
import 'package:ketech_booking/bindings/dashboardB.dart';
import 'package:ketech_booking/bindings/invoiceB.dart';
import 'package:ketech_booking/bindings/loginB.dart';
import 'package:ketech_booking/pages/account/account_page.dart';
import 'package:ketech_booking/pages/booking/booking_detail_page.dart';
import 'package:ketech_booking/pages/booking/booking_page.dart';
import 'package:ketech_booking/pages/booking/components/cargo_schedule_page.dart';
import 'package:ketech_booking/pages/history/history_detail_page.dart';
import 'package:ketech_booking/pages/history/history_page.dart';
import 'package:ketech_booking/pages/home/home_page.dart';
import 'package:ketech_booking/pages/invoice/invoice_page.dart';
import 'package:ketech_booking/pages/login/login_page.dart';
import 'package:ketech_booking/pages/signup/signup_page.dart';
import 'package:ketech_booking/pages/splash/splash_page.dart';
import 'package:ketech_booking/pages/welcome/welcome_page.dart';
import 'package:get/get.dart';

import '../bindings/bookingB.dart';
import '../pages/dahsboard/dashboard.dart';
import 'routes_name.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.splash,
      page: () => SplashPage(),
    ),
    GetPage(
      name: Routes.welcome,
      page: () => const WelcomePAge(),
    ),
    GetPage(
      name: Routes.login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.signup,
      page: () => SignupPage(),
    ),
    GetPage(name: Routes.dashboard, page: () => Dashboard(), bindings: [
      DashboardBinding(),
      AccountBinding(),
      BookingBinding(),
      InvoiceBinding(),
    ]),
    GetPage(
      name: Routes.home,
      page: () => HomePage(),
    ),
    GetPage(
      name: Routes.booking,
      page: () => BookingPage(),
    ),
    GetPage(
      name: Routes.bookingDetail,
      page: () => BookingDetailPage(),
      bindings: [CommodityBinding()],
    ),
    GetPage(
      name: Routes.cargoSchedule,
      page: () => CargoSchedulePage(),
    ),
    GetPage(
      name: Routes.history,
      page: () => HistoryPage(),
    ),
    GetPage(
      name: Routes.historyDetail,
      page: () => HistoryDetailPage(),
    ),
    GetPage(
        name: Routes.account,
        page: () => AccountPage(),
        binding: AccountBinding()),
    GetPage(
        name: Routes.invoice,
        page: () => InvoicePage(),
        binding: InvoiceBinding()),
  ];
}
