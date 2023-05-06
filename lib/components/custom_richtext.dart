import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../style/colors.dart';
import '../theme/app_theme.dart';

class CustomRichText extends StatelessWidget {
  final String discription;
  final String text;
  final Function() onTap;
  const CustomRichText(
      {Key? key,
      required this.discription,
      required this.text,
      required this.onTap})
      : super(key: key);
// "Don't already Have an account? "
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Get.height * 0.08),
      child: Text.rich(
        TextSpan(
            text: discription,
            style: appThemeData.textTheme.bodyText1,
            children: [
              TextSpan(
                  text: text,
                  style: appThemeData.textTheme.bodyText1
                      ?.copyWith(color: kPrimaryColor),
                  recognizer: TapGestureRecognizer()..onTap = onTap),
            ]),
      ),
    );
  }
}
