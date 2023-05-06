import 'package:flutter/material.dart';

import '../style/colors.dart';
import '../theme/app_theme.dart';


class CustomHeader extends StatelessWidget {
  final String text;
  final Function()? onTap;
  const CustomHeader({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16, left: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: onTap,
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Color(0xFFF8F9FA),
              size: 24,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Text(
            text,
            style: appThemeData.textTheme.headline4?.copyWith(color: kWhiteColor),
          )
        ],
      ),
    );
  }
}
