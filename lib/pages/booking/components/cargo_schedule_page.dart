import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/custom_app_bar.dart';
import '../../../components/custom_booking_card.dart';
import '../../../controllers/bookingC.dart';
import '../../../routes/routes_name.dart';
import '../../../style/paddings.dart';

class CargoSchedulePage extends GetView<BookingController> {
  CargoSchedulePage({Key? key}) : super(key: key);

  final arg = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomSecondaryAppBar('Cargo Schedule'),
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: kPagePadding),
        child: ListView.builder(
          itemCount: controller.listSchedule.length,
          itemBuilder: (context, i) {
            return CustomBookingCard(
                widget: 'schedule',
                id: controller.listSchedule[i].id!.toString(),
                cargoType: controller.listSchedule[i].transportMode,
                carrier: controller.listSchedule[i].carrier!.nama,
                carrierId: controller.listSchedule[i].carrier!.id!.toString(),
                voyageRef: controller.listSchedule[i].voyageDeparture,
                placeDeparture: controller.listSchedule[i].placeDeparture,
                placeArrival: controller.listSchedule[i].placeArrival,
                departureDay: 'Senin',
                arrivalDay: 'Selasa',
                departureDate: controller.listSchedule[i].tglDeparture,
                arrivalDate: controller.listSchedule[i].tglArrival,
                duration: '2 Weeks',
                discount: '10%',
                onTap: (){
                    Get.toNamed(Routes.bookingDetail, arguments: {
                      'transport_mode': controller.listSchedule[i].transportMode,
                      'port_loading': controller.listSchedule[i].placeDeparture,
                      'port_discharge': controller.listSchedule[i].placeArrival,
                      'date_departure': controller.listSchedule[i].tglDeparture,
                      'date_arrival':  controller.listSchedule[i].tglArrival,
                      'schedule_id': controller.listSchedule[i].id!.toString(),
                      'carrier': controller.listSchedule[i].carrier!.id!.toString(),
                      'quotation': arg['quotation'],
                      'smOrigin': arg['smOrigin'],
                      'smDeparture': arg['smDeparture'],

                    });
                  
                });
          },
        ),
      )),
    );
  }
}
