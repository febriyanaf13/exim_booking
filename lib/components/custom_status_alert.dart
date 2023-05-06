import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status_alert/status_alert.dart';

import '../style/colors.dart';
import '../style/paddings.dart';
import '../theme/app_theme.dart';


void customStatusAlert(String type, String title, String subtitle) {
  IconData? icon;
  Color? color;
  if (type == 'success') {
    icon = Icons.check_circle_outline;
    color = kPrimaryColor;
  } else if (type == 'warning') {
    icon = Icons.warning_amber_outlined;
    color = kWarningrColor;
  } else if (type == 'error') {
    icon = Icons.highlight_off_outlined;
    color = kErrorColor;
  } else if (type == 'server') {
    icon = Icons.cloud_off_outlined;
    color = kErrorColor;
  }
  return StatusAlert.show(
    Get.overlayContext!,
    duration: Duration(seconds: 2),
    title: title,
    backgroundColor: kGreyColor.withOpacity(0.9),
    padding: EdgeInsets.all(kContentPadding),
    titleOptions: StatusAlertTextConfiguration(
        style: textTheme().subtitle1!.copyWith(color: color)),
    subtitle: subtitle,
    subtitleOptions: StatusAlertTextConfiguration(
        overflow: TextOverflow.ellipsis, maxLines: 2),
    margin: EdgeInsets.all(100),
    configuration: IconConfiguration(icon: icon!, color: color, size: 70),
  );
}
