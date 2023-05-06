import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ketech_booking/utils/extension_image.dart';

import '../../routes/routes_name.dart';
import '../../style/borders.dart';
import '../../style/colors.dart';
import '../../style/paddings.dart';
import '../../theme/app_theme.dart';
import 'components/items.dart';

class WelcomePAge extends StatefulWidget {
  const WelcomePAge({Key? key}) : super(key: key);

  @override
  State<WelcomePAge> createState() => _WelcomePAgeState();
}

class _WelcomePAgeState extends State<WelcomePAge> {
  double currentPage = 0.0;
  var currentIndex = 0;
  final _pageViewController = PageController();

  List<Widget> indicator() => List<Widget>.generate(slides.length, (index) {
        currentIndex = index;
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 3.0),
          height: 10.0,
          width: 10.0,
          decoration: BoxDecoration(
              color: currentPage.round() == index
                  ? kPrimaryColor
                  : kPrimaryColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10.0)),
        );
      });

  List<Widget> slides = items
      .map((item) => Container(
          color: kBackgroundColor,
          child: Column(
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: Center(
                  child: Text('Welcome',
                      textAlign: TextAlign.left,
                      style: appThemeData.textTheme.headline4!
                          .copyWith(color: kPrimaryColor)),
                ),
              ),
              Flexible(
                flex: 5,
                fit: FlexFit.tight,
                child: Image.asset(
                  '${item['image']}'.png,
                  fit: BoxFit.fitWidth,
                  width: Get.width,
                  alignment: Alignment.bottomCenter,
                ),
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'PT. KEMASINDO CEPAT NUSANTARA',
                      style: TextStyle(color: kPrimaryColor),
                    )
                  ],
                ),
              ),
              Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    children: <Widget>[
                      Text(item['header'],
                          style: appThemeData.textTheme.headline4!
                              .copyWith(color: kPrimaryColor)),
                      const SizedBox(
                        height: kContentPadding,
                      ),
                      item['description'] == 'Mulai'
                          ? Row(
                              children: [
                                Expanded(
                                  child: TextButton(
                                      onPressed: () {
                                        Get.toNamed(Routes.login);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: kPrimaryColor,
                                            borderRadius: BorderRadius.circular(
                                                kDefaultBorder)),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 15, horizontal: 50),
                                          child: Text(
                                            'Mulai',
                                            style: appThemeData
                                                .textTheme.bodyText2
                                                ?.copyWith(
                                                    color: kWhiteTextColor),
                                          ),
                                        ),
                                      )),
                                ),
                                Expanded(
                                  child: TextButton(
                                      onPressed: () {},
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: kAccentColor,
                                            borderRadius: BorderRadius.circular(
                                                kDefaultBorder)),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 15, horizontal: 50),
                                          child: Text(
                                            'Explore',
                                            style: appThemeData
                                                .textTheme.bodyText2
                                                ?.copyWith(
                                                    color: kWhiteTextColor),
                                          ),
                                        ),
                                      )),
                                ),
                              ],
                            )
                          : Text(
                              item['description'],
                              style: appThemeData.textTheme.bodyText1!
                                  .copyWith(color: kSecondaryTextColor),
                              textAlign: TextAlign.center,
                            )
                    ],
                  ),
                ),
              ),
            ],
          )))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: kBackgroundColor,
          child: Stack(
            children: <Widget>[
              PageView.builder(
                controller: _pageViewController,
                itemCount: slides.length,
                itemBuilder: (BuildContext context, int index) {
                  _pageViewController.addListener(() {
                    setState(() {
                      currentPage = _pageViewController.page!;
                    });
                  });
                  return slides[index];
                },
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: const EdgeInsets.only(top: 70.0),
                    padding: const EdgeInsets.symmetric(vertical: 40.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: indicator(),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
