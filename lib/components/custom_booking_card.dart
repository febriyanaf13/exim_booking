import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../style/borders.dart';
import '../../style/colors.dart';

import '../style/paddings.dart';

class CustomBookingCard extends StatelessWidget {
  const CustomBookingCard({
    Key? key,
    this.cargoType,
    this.discount,
    this.voyageRef,
    this.placeDeparture,
    this.placeArrival,
    this.duration,
    this.widget,
    this.departureDay,
    this.arrivalDay,
    this.arrivalDate,
    this.departureDate,
    this.carrier,
    this.id,
    this.carrierId, this.onTap,
  }) : super(key: key);

  final String? id;
  final String? cargoType;
  final String? discount;
  final String? voyageRef;
  final String? placeDeparture;
  final String? placeArrival;
  final String? departureDay;
  final String? departureDate;
  final String? arrivalDay;
  final String? arrivalDate;
  final String? duration;
  final String? widget;
  final String? carrier;
  final String? carrierId;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    IconData icon;
    if (cargoType == 'AIR FREIGHT') {
      icon = Icons.airplane_ticket;
    } else if (cargoType == 'SEA FREIGHT') {
      icon = Icons.directions_boat_filled_rounded;
    } else if (cargoType == 'LAND') {
      icon = Icons.local_shipping_rounded;
    } else {
      icon = Icons.local_shipping_rounded;
    }

    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kDefaultBorder)),
        child: Column(
          children: [
            SizedBox(
              height: 40,
              width: Get.width - 60,
              child: Stack(
                children: [
                  Positioned(
                      top: 10,
                      left: 10,
                      child: Row(
                        children: [
                          Icon(
                            icon,
                            size: 30,
                            color: kPrimaryColor,
                          ),
                          SizedBox(width: kContentPadding),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 4, vertical: 2),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: kAccentColor),
                                borderRadius:
                                    BorderRadius.circular(kDefaultBorder)),
                            child: Text(
                              cargoType!,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  ?.copyWith(
                                    color: kAccentColor,
                                  ),
                            ),
                          ),
                        ],
                      )),
                  discount == null
                      ? Container()
                      : Positioned(
                          top: 0,
                          right: 0,
                          child: ClipPath(
                            clipper: CustomTriangleClipper(),
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(kDefaultBorder)),
                                gradient: LinearGradient(
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                  colors: [kPrimaryColor, Color(0xffF2BB77)],
                                ),
                              ),
                              child: Align(
                                  alignment: Alignment.topRight,
                                  child: Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(discount!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .overline
                                                ?.copyWith(
                                                    color: kWhiteTextColor,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                        Text('Off',
                                            style: Theme.of(context)
                                                .textTheme
                                                .overline
                                                ?.copyWith(
                                                    color: kWhiteTextColor,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                      ],
                                    ),
                                  )),
                            ),
                          )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(kContentPadding),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Carrier : ',
                          style: Theme.of(context).textTheme.overline,
                          children: <TextSpan>[
                            TextSpan(
                                text: carrier!,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: kPrimaryColor)),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Voyage Ref : ',
                          style: Theme.of(context).textTheme.overline,
                          children: <TextSpan>[
                            TextSpan(
                                text: voyageRef!,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: kPrimaryColor)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: kContentPadding,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(placeDeparture!,
                              style: Theme.of(context).textTheme.bodyText2),
                          SizedBox(
                            height: 5,
                          ),
                          Text(departureDay!,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  ?.copyWith(color: kAccentColor)),
                          SizedBox(
                            height: 5,
                          ),
                          Text(departureDate!,
                              style: Theme.of(context)
                                  .textTheme
                                  .overline
                                  ?.copyWith(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.chevron_right,
                            color: kPrimaryColor,
                          ),
                          Text('Duration $duration',
                              style: Theme.of(context).textTheme.overline),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(placeArrival!,
                              style: Theme.of(context).textTheme.bodyText2),
                          SizedBox(
                            height: 5,
                          ),
                          Text(arrivalDay!,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  ?.copyWith(color: kAccentColor)),
                          SizedBox(
                            height: 5,
                          ),
                          Text(arrivalDate!,
                              style: Theme.of(context)
                                  .textTheme
                                  .overline
                                  ?.copyWith(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
