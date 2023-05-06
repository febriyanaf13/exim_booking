// ignore_for_file: constant_identifier_names

abstract class Api {
  //base url
  static const BASE_URL_KETECH = 'http://ketechs.freightapp.in/api';
  static const BASE_URL_KETECH_BOOKING =
      'http://ketechsbooking.freightapp.in/api';

  //token
  static const TOKEN_LOGIN = BASE_URL_KETECH_BOOKING + '/login';
  static const TOKEN = BASE_URL_KETECH + '/login';

  //Login
  static const LOGIN = BASE_URL_KETECH_BOOKING + '/uslogin';

  //transport mode
  static const TRANSPORT_MODE = BASE_URL_KETECH + '/list_activity';

  //list kota
  static const LIST_KOTA = BASE_URL_KETECH + '/list_kota?search=';

  //list carrier
  static const LIST_CARRIER = BASE_URL_KETECH + '/list_carrier?search=';

  //list Scedule
  static const LIST_SCHEDULE = BASE_URL_KETECH + '/list_schedule_mobile';

  //list invoice
  static const LIST_INVOICE = BASE_URL_KETECH + '/invoice_user';
  
  //list commodity
  static const LIST_COMMODITY = BASE_URL_KETECH + '/list_commodity';
  
  //list container
  static const LIST_CONTAINER = BASE_URL_KETECH + '/list_container';
  
  //list packaging
  static const LIST_PACKAGING = BASE_URL_KETECH + '/list_package';
  
  //list shipper
  static const LIST_SHIPPER = BASE_URL_KETECH + '/list_shipper';
  
  //simpan booking
  static const SIMPAN_BOOKING = BASE_URL_KETECH_BOOKING + '/simpan_booking';
}
