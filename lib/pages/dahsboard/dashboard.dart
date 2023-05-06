import 'package:flutter/material.dart';
import 'package:ketech_booking/pages/invoice/invoice_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../style/colors.dart';
import '../account/account_page.dart';
import '../booking/booking_page.dart';
import '../history/history_page.dart';
import '../home/home_page.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  PersistentTabController? _controller;

  final _buildSctreen = <Widget>[
    HomePage(),
    BookingPage(),
    HistoryPage(),
    InvoicePage(),
    AccountPage(),
  ];

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home_filled),
        title: ("Home"),
        activeColorPrimary: kPrimaryColor,
        inactiveColorPrimary: kPrimaryTextColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.book),
        title: ("Booking"),
        activeColorPrimary: kPrimaryColor,
        inactiveColorPrimary: kPrimaryTextColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.history_sharp),
        title: ("History"),
        activeColorPrimary: kPrimaryColor,
        inactiveColorPrimary: kPrimaryTextColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.receipt),
        title: ("Invoice"),
        activeColorPrimary: kPrimaryColor,
        inactiveColorPrimary: kPrimaryTextColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person),
        title: ("Account"),
        activeColorPrimary: kPrimaryColor,
        inactiveColorPrimary: kPrimaryTextColor,
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _controller = PersistentTabController(initialIndex: 0);

    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildSctreen,
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style9,
    );
  }
}
