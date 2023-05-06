import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ketech_booking/utils/extension_image.dart';

import '../../controllers/splashC.dart';
import '../../style/colors.dart';
import '../../style/paddings.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(),
        Container(
          height: Get.height * 0.27,
          decoration: BoxDecoration(
              color: kBackgroundColor,
              image: DecorationImage(image: AssetImage('bg_splash'.png))),
        ),
        SizedBox(
          height: 100,
          width: Get.width * 0.8,
          child: Padding(
            padding: EdgeInsets.all(kElementPadding),
            child: Image.asset("kece_logo2".png),
          ),
        ),
        Spacer(),
        CupertinoActivityIndicator(
            animating: true, radius: 20, color: kPrimaryColor),
        Spacer(),
        Text('Ketech Booking',
            textAlign: TextAlign.left,
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: kPrimaryColor)),
        Spacer(),
      ],
    )));
  }
}
