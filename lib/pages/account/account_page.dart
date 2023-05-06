
import 'package:flutter/material.dart';
import 'package:flutter_image/flutter_image.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ant_design.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:iconify_flutter/icons/carbon.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/ion.dart';
import 'package:iconify_flutter/icons/majesticons.dart';

import '../../controllers/accountC.dart';
import '../../style/borders.dart';
import '../../style/colors.dart';
import '../../style/paddings.dart';
import '../../utils/constants.dart';

class AccountPage extends GetView<AccountController> {
  AccountPage({Key? key}) : super(key: key);

  final userData = storage.read('userData');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        height: double.infinity,
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.only(
                  top: kPagePadding, right: kPagePadding, left: kPagePadding),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${userData['nama']}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                ?.copyWith(color: kPrimaryColor),
                          ),
                          Text('${userData['nama_perusahaan']}',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2
                                  ?.copyWith(color: kSecondaryTextColor)),
                        ],
                      ),
                      SizedBox(
                        width: kElementPadding,
                      ),
                      Container(
                        height: 73,
                        width: 73,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: kBoxColor, width: 2),
                            color: kWhiteColor,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
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
                            padding: const EdgeInsets.all(15),
                            child: Iconify(
                              AntDesign.user_outline,
                              color: kAccentColor,
                            ),
                          ),
                          loadingBuilder: (context, exception, stackTrack) =>
                              CircularProgressIndicator(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: kContainerPadding,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(kDefaultBorder)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kElementPadding / 2,
                          vertical: kElementPadding),
                      child: Column(
                        children: [
                          GestureDetector(
                              onTap: () {},
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Iconify(Carbon.user_filled,
                                            color: kPrimaryColor),
                                        SizedBox(
                                          width: kElementPadding,
                                        ),
                                        Text(
                                          'Manage my account',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1
                                              ?.copyWith(
                                                  color: kPrimaryTextColor),
                                        )
                                      ],
                                    ),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_right,
                                    color: kAccentColor,
                                  )
                                ],
                              )),
                          SizedBox(
                            height: kElementPadding,
                          ),
                          Divider(
                            height: 1,
                            color: kDarkGreyColor,
                          ),
                          SizedBox(
                            height: kElementPadding,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Row(
                              children: [
                                Expanded(
                                    child: Row(
                                  children: [
                                    Iconify(Bi.lock_fill, color: kPrimaryColor),
                                    SizedBox(
                                      width: kElementPadding,
                                    ),
                                    Text(
                                      'Privacy and savety',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          ?.copyWith(color: kPrimaryTextColor),
                                    )
                                  ],
                                )),
                                Icon(
                                  Icons.keyboard_arrow_right,
                                  color: kAccentColor,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: kElementPadding,
                          ),
                          Divider(
                            height: 1,
                            color: kDarkGreyColor,
                          ),
                          SizedBox(
                            height: kElementPadding,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Row(
                              children: [
                                Expanded(
                                    child: Row(
                                  children: [
                                    Iconify(Ic.round_videocam,
                                        color: kPrimaryColor),
                                    SizedBox(
                                      width: kElementPadding,
                                    ),
                                    Text(
                                      'Registrasion',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          ?.copyWith(color: kPrimaryTextColor),
                                    )
                                  ],
                                )),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_right,
                                      color: kAccentColor,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: kElementPadding,
                          ),
                          Divider(
                            height: 1,
                            color: kDarkGreyColor,
                          ),
                          SizedBox(
                            height: kElementPadding,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Row(
                              children: [
                                Expanded(
                                    child: Row(
                                  children: [
                                    Iconify(Ion.wallet, color: kPrimaryColor),
                                    SizedBox(
                                      width: kElementPadding,
                                    ),
                                    Text(
                                      'Balance',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          ?.copyWith(color: kPrimaryTextColor),
                                    )
                                  ],
                                )),
                                Icon(
                                  Icons.keyboard_arrow_right,
                                  color: kAccentColor,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: kElementPadding,
                          ),
                          Divider(
                            height: 1,
                            color: kDarkGreyColor,
                          ),
                          SizedBox(
                            height: kElementPadding,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Row(
                                children: [
                                  Iconify(Bi.share_fill,
                                      color: kPrimaryColor),
                                  SizedBox(
                                    width: kElementPadding,
                                  ),
                                  Text(
                                    'Links',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.copyWith(color: kPrimaryTextColor),
                                  )
                                ],
                              )),
                              Icon(
                                Icons.keyboard_arrow_right,
                                color: kAccentColor,
                              )
                            ],
                          ),
                          SizedBox(
                            height: kElementPadding,
                          ),
                          Divider(
                            height: 1,
                            color: kDarkGreyColor,
                          ),
                          SizedBox(
                            height: kElementPadding,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: GestureDetector(
                                child: Row(
                                  children: [
                                    Iconify(Majesticons.logout,
                                        color: kPrimaryColor),
                                    SizedBox(
                                      width: kElementPadding,
                                    ),
                                    GestureDetector(
                                      onTap: () => controller.doLogout(),
                                      child: Text(
                                        'Logout',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            ?.copyWith(
                                                color: kPrimaryTextColor),
                                      ),
                                    )
                                  ],
                                ),
                                onTap: () {},
                              )),
                              Icon(
                                Icons.keyboard_arrow_right,
                                color: kAccentColor,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Obx(() => Positioned(
                bottom: 10,
                right: 10,
                child: Text(
                  'Version ${controller.version}',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(color: kSecondaryTextColor),
                )))
          ],
        ),
      )),
    );
  }
}
