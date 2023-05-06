import 'package:flutter/material.dart';

import '../style/borders.dart';
import '../style/colors.dart';
import '../style/paddings.dart';

ThemeData get appThemeData => ThemeData(
  fontFamily: 'Poppins',
  scaffoldBackgroundColor: kBackgroundColor,
  errorColor: kErrorColor,
  colorScheme: ThemeData()
      .colorScheme
      .copyWith(primary: kPrimaryColor, error: kErrorColor),
  textTheme: textTheme(),
  inputDecorationTheme: inputDecorationTheme(),
);

InputDecorationTheme inputDecorationTheme() {
  return InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    focusColor: kSecondaryTextColor,
    contentPadding: const EdgeInsets.all(kContentPadding),
    enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: kInputBorderColor,
        ),
        borderRadius: BorderRadius.circular(kInputBorder),
        gapPadding: 10),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(kInputBorder),
        borderSide: const BorderSide(color: kPrimaryColor),
        gapPadding: 10),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(kInputBorder),
        borderSide: const BorderSide(color: kErrorColor),
        gapPadding: 10),
    focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(kInputBorder),
        borderSide: const BorderSide(color: kErrorColor),
        gapPadding: 10),
    disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(kInputBorder),
        borderSide: const BorderSide(color: kInputBorderColor),
        gapPadding: 10),
  );
}

TextTheme textTheme() {
  return const TextTheme(
    bodyText1: TextStyle(
        fontSize: 15,
        color: kPrimaryTextColor,
        fontWeight: FontWeight.w300,
        letterSpacing: 0),
    bodyText2: TextStyle(
        fontSize: 13,
        color: kPrimaryTextColor,
        fontWeight: FontWeight.w300,
        letterSpacing: 0),
    headline4: TextStyle(
        fontSize: 28,
        color: kPrimaryTextColor,
        fontWeight: FontWeight.w600,
        letterSpacing: 0),
    headline5: TextStyle(
        fontSize: 23,
        color: kPrimaryTextColor,
        fontWeight: FontWeight.w700,
        letterSpacing: 0),
    headline6: TextStyle(
        fontSize: 19,
        color: kPrimaryTextColor,
        fontWeight: FontWeight.w600,
        letterSpacing: 0),
    subtitle1: TextStyle(
        fontSize: 15,
        color: kPrimaryTextColor,
        fontWeight: FontWeight.w600,
        letterSpacing: 0),
    subtitle2: TextStyle(
        fontSize: 13,
        color: kPrimaryTextColor,
        fontWeight: FontWeight.w600,
        letterSpacing: 0),
    overline: TextStyle(
        fontSize: 10,
        color: kPrimaryTextColor,
        fontWeight: FontWeight.w300,
        letterSpacing: 0),
    labelMedium: TextStyle(
        fontSize: 7,
        color: kPrimaryTextColor,
        fontWeight: FontWeight.w500,
        letterSpacing: 0),
  );
}
