import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../style/colors.dart';
import '../style/paddings.dart';

void snackbarError(String title, String msg) {
  Get.snackbar(title, msg,
      colorText: kErrorColor,
      icon: Padding(
        padding: const EdgeInsets.all(kContentPadding),
        child: Icon(
          Icons.highlight_off_outlined,
          color: kErrorColor,
          size: 30,
        ),
      ));
}

void snackbarWarning(String title, String msg) {
  Get.snackbar(title, msg,
      colorText: kWarningrColor,
      icon: Padding(
        padding: const EdgeInsets.all(kContentPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.error_outline_outlined,
              color: kWarningrColor,
              size: 30,
            ),
          ],
        ),
      ));
}

void snackbarSuccess(String title, String msg) {
  Get.snackbar(title, msg,
      colorText: kSuccessColor,
      icon: Padding(
        padding: const EdgeInsets.all(kContentPadding),
        child: Icon(
          Icons.check_circle_outlined,
          color: kSuccessColor,
          size: 30,
        ),
      ));
}
