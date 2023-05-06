import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';

import '../style/colors.dart';
import '../style/paddings.dart';

class CustomPrimaryAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String title;
  final List<Widget>? action;
  final PreferredSize? tabBar;
  CustomPrimaryAppBar(
    this.title, {
    Key? key,
    this.action,
    this.tabBar,
  })  : preferredSize = const Size.fromHeight(50.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .headline5
            ?.copyWith(color: kPrimaryColor),
      ),
      titleSpacing: kPagePadding,
      
      backgroundColor: kBackgroundColor,
      automaticallyImplyLeading: false,
      elevation: 0,
      actions: action,
      bottom: tabBar,
    );
  }
}

class CustomSecondaryAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String title;
  final List<Widget>? action;
  final PreferredSize? tabBar;

  CustomSecondaryAppBar(
    this.title, {
    Key? key,
    this.action,
    this.tabBar,
  })  : preferredSize = const Size.fromHeight(50.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: kPagePadding),
        child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Iconify(Bi.arrow_left_square_fill, color: kPrimaryColor,)),
      ),
      title: Align(
        alignment: Alignment.centerRight,
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headline5
              ?.copyWith(color: kPrimaryColor),
        ),
      ),
      titleSpacing: kPagePadding,
      backgroundColor: kBackgroundColor,
      elevation: 0,
      iconTheme: const IconThemeData(color: kPrimaryColor),
      automaticallyImplyLeading: false,
      actions: action,
      bottom: tabBar,
    );
  }
}
