import 'package:flutter/material.dart';

import '../style/borders.dart';
import '../style/colors.dart';

class RoundedTextButton extends StatelessWidget {
  final String? text;
  final Color? colorBackground, textColor;
  final Function()? onPressed;
  const RoundedTextButton({
    Key? key,
    this.colorBackground,
    this.textColor,
    this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: kPrimaryColor, backgroundColor: colorBackground,
          minimumSize: const Size(88, 36),
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(kDefaultBorder)),
          ),
        ),
        child: Text(
          text == null ? "" : text!,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
