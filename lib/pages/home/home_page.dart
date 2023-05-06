import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image/flutter_image.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ant_design.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:ketech_booking/utils/extension_image.dart';

import '../../controllers/homeC.dart';
import '../../style/borders.dart';
import '../../style/colors.dart';
import '../../style/paddings.dart';
import '../../utils/constants.dart';

class HomePage extends GetView<HomeController> {
  HomePage({Key? key}) : super(key: key);
  final userData = storage.read('userData');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: Get.height,
            width: Get.width,
            color: kBackgroundColor,
          ),
          Container(
            height: Get.height * 0.32,
            width: Get.width,
            decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(20))),
            child: SafeArea(
                child: Padding(
              padding: EdgeInsets.all(kPagePadding),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hi, ${userData['nama']}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  ?.copyWith(
                                      color: kWhiteTextColor,
                                      fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${userData['nama_perusahaan']}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(color: kWhiteTextColor),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: kBoxColor, width: 2),
                            color: kWhiteColor,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.7),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: Offset(1, 2))
                            ]),
                        child: Image(
                          fit: BoxFit.cover,
                          image: NetworkImageWithRetry(
                            'https://sim.unissula.ac.id/app/modules/sdm/uploads/fotopeg/2.jpg',
                          ),
                          errorBuilder: (context, exception, stackTrack) =>
                              Padding(
                            padding: EdgeInsets.all(kElementPadding),
                            child: Iconify(
                              AntDesign.user_outline,
                              color: kSecondaryTextColor,
                            ),
                          ),
                          loadingBuilder: (context, exception, stackTrack) =>
                              CircularProgressIndicator(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: kElementPadding,
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            flex: 2,
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: kWhiteColor),
                              child: Stack(
                                children: [
                                  Positioned(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset('dompet'.png,
                                          scale: 4,
                                          color: Colors.white.withOpacity(0.3),
                                          colorBlendMode: BlendMode.modulate),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Padding(
                                      padding: EdgeInsets.all(kContentPadding),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            'Rp.235.421.000',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6
                                                ?.copyWith(
                                                    fontWeight:
                                                        FontWeight.bold),
                                          ),
                                          Text(
                                            'Total Spanding YTD',
                                            style: Theme.of(context)
                                                .textTheme
                                                .overline,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        SizedBox(
                          width: kElementPadding,
                        ),
                        Expanded(
                            flex: 1,
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: kWhiteColor),
                              child: Stack(
                                children: [
                                  Positioned(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset('graph'.png,
                                          color: Colors.white.withOpacity(0.3),
                                          colorBlendMode: BlendMode.modulate),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Padding(
                                      padding: EdgeInsets.all(kContentPadding),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            '237',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6
                                                ?.copyWith(
                                                    fontWeight:
                                                        FontWeight.bold),
                                          ),
                                          Text('Total Transaction',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .overline),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            )),
          ),
          Positioned(
            top: Get.height * 0.32,
            child: SizedBox(
                width: Get.width,
                height: Get.height * 0.65,
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(kPagePadding),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total Spending YTD',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    ?.copyWith(color: kSecondaryTextColor),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'More Info ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .overline
                                        ?.copyWith(color: kAccentColor),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 8,
                                    color: kAccentColor,
                                  )
                                ],
                              ),
                            ],
                          ),
                          Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(kDefaultBorder)),
                              child: Column(
                                children: [
                                  TotalSpendingYTDCard(
                                    jenis: 'Air Freight',
                                    total: '100',
                                  ),
                                  Divider(
                                    color: Colors.grey,
                                    height: 1,
                                  ),
                                  TotalSpendingYTDCard(
                                    jenis: 'Sea Freight',
                                    total: '70',
                                  ),
                                  Divider(
                                    color: Colors.grey,
                                    height: 1,
                                  ),
                                  TotalSpendingYTDCard(
                                    jenis: 'Land',
                                    total: '50',
                                  )
                                ],
                              ))
                        ],
                      ),
                      SizedBox(height: kContainerPadding),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'My Shipment Info',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    ?.copyWith(color: kSecondaryTextColor),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'More Info ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .overline
                                        ?.copyWith(color: kAccentColor),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 8,
                                    color: kAccentColor,
                                  )
                                ],
                              ),
                            ],
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(kDefaultBorder)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      kDefaultBorder)),
                                          child: Container(
                                            height: 40,
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                                color: Colors.yellow,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        kDefaultBorder)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Iconify(
                                                  Bi.alarm_fill,
                                                  size: 20,
                                                  color: kGreyColor,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left:
                                                              kContentPadding),
                                                  child: Text('1',
                                                      textAlign:
                                                          TextAlign.right,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .subtitle1
                                                          ?.copyWith(
                                                              color:
                                                                  kWhiteTextColor)),
                                                ),
                                              ],
                                            ),
                                          )),
                                      Text(
                                        'Waiting',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      kDefaultBorder)),
                                          child: Container(
                                            height: 40,
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                                color: Colors.blue,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        kDefaultBorder)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Icon(
                                                  Icons.local_shipping_rounded,
                                                  size: 20,
                                                  color: kGreyColor,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left:
                                                              kContentPadding),
                                                  child: Text('34',
                                                      textAlign:
                                                          TextAlign.right,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .subtitle1
                                                          ?.copyWith(
                                                              color:
                                                                  kWhiteTextColor)),
                                                ),
                                              ],
                                            ),
                                          )),
                                      Text(
                                        'On going',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      kDefaultBorder)),
                                          child: Container(
                                            height: 40,
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                                color: Colors.green,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        kDefaultBorder)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Iconify(
                                                  Bi.clipboard_check_fill,
                                                  size: 20,
                                                  color: kGreyColor,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left:
                                                              kContentPadding),
                                                  child: Text('178',
                                                      textAlign:
                                                          TextAlign.right,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .subtitle1
                                                          ?.copyWith(
                                                              color:
                                                                  kWhiteTextColor)),
                                                ),
                                              ],
                                            ),
                                          )),
                                      Text(
                                        'Success',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      kDefaultBorder)),
                                          child: Container(
                                            height: 40,
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        kDefaultBorder)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Iconify(
                                                  Bi.clipboard_x_fill,
                                                  size: 20,
                                                  color: kGreyColor,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left:
                                                              kContentPadding),
                                                  child: Text('1',
                                                      textAlign:
                                                          TextAlign.right,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .subtitle1
                                                          ?.copyWith(
                                                              color:
                                                                  kWhiteTextColor)),
                                                ),
                                              ],
                                            ),
                                          )),
                                      Text(
                                        'Failed',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: kContainerPadding),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Last Booking',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    ?.copyWith(color: kSecondaryTextColor),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'More Info ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .overline
                                        ?.copyWith(color: kAccentColor),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 8,
                                    color: kAccentColor,
                                  )
                                ],
                              ),
                            ],
                          ),
                          CarouselSlider(
                            options: CarouselOptions(height: 100),
                            items: [1, 2, 3, 4, 5].map((i) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            kDefaultBorder)),
                                    child: Container(
                                        width: Get.width,
                                        margin:
                                            EdgeInsets.symmetric(horizontal: 5),
                                        decoration: BoxDecoration(
                                            color: kBoxColor,
                                            borderRadius: BorderRadius.circular(
                                                kDefaultBorder)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(
                                              kContentPadding),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 4,
                                                              vertical: 2),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              width: 1,
                                                              color:
                                                                  kAccentColor),
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  kDefaultBorder)),
                                                      child: Text(
                                                        'Air Freight',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .subtitle1
                                                            ?.copyWith(
                                                              color:
                                                                  kAccentColor,
                                                            ),
                                                      ),
                                                    ),
                                                    Text('#234567898765',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .overline),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Expanded(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text('IDSRG',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .subtitle2),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 2),
                                                      child: Icon(
                                                        Icons.airplane_ticket,
                                                        color: kPrimaryColor,
                                                      ),
                                                    ),
                                                    Text('IDCGK',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .subtitle2),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text('Sunday,',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyText2),
                                                    Text(
                                                      '13 Feb 2022',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .subtitle1
                                                          ?.copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        )),
                                  );
                                },
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                      SizedBox(height: kContentPadding),
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}

class TotalSpendingYTDCard extends StatelessWidget {
  const TotalSpendingYTDCard({
    Key? key,
    this.jenis,
    this.total,
  }) : super(key: key);

  final String? jenis;
  final String? total;

  @override
  Widget build(BuildContext context) {
    IconData icon;
    if (jenis == 'Air Freight') {
      icon = Icons.airplane_ticket;
    } else if (jenis == 'Sea Freight') {
      icon = Icons.directions_boat_filled_rounded;
    } else {
      icon = Icons.local_shipping_rounded;
    }

    return SizedBox(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    color: kPrimaryColor,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    jenis == null ? '-' : jenis!,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
              child: Text(total == null ? '-' : ' ${total!} Files',
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      color: kAccentColor, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
