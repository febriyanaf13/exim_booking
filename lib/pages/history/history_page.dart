import 'package:flutter/material.dart';

import '../../components/custom_app_bar.dart';
import '../../components/custom_booking_card.dart';
import '../../style/borders.dart';
import '../../style/colors.dart';
import '../../style/paddings.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(100),
            child: CustomPrimaryAppBar(
              'History',
              action: [
                IconButton(
                  icon: Icon(Icons.search, color: kAccentColor),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.date_range, color: kAccentColor),
                  onPressed: () {},
                ),
              ],
              tabBar: PreferredSize(
                preferredSize: Size.fromHeight(50),
                child: SizedBox(
                  child: TabBar(
                      labelColor: kWhiteColor,
                      labelStyle: Theme.of(context).textTheme.subtitle1,
                      unselectedLabelColor: kPrimaryColor,
                      indicatorColor: kWhiteColor,
                      isScrollable: true,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(kDefaultBorder),
                        color: kAccentColor,
                      ),
                      padding: EdgeInsets.all(10),
                      tabs: [
                        Tab(text: 'All'),
                        Badge(
                            label: Text(
                              '3',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  ?.copyWith(
                                      color: kWhiteTextColor,
                                      fontWeight: FontWeight.bold),
                            ),
                            child: Tab(text: 'Waiting for payment')),
                        Badge(
                            label: Text(
                              '5',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  ?.copyWith(
                                      color: kWhiteTextColor,
                                      fontWeight: FontWeight.bold),
                            ),
                            child: Tab(text: 'On Going')),
                        Badge(
                            label: Text(
                              '10',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  ?.copyWith(
                                      color: kWhiteTextColor,
                                      fontWeight: FontWeight.bold),
                            ),
                            child: Tab(text: 'Completed')),
                        Badge(
                            label: Text(
                              '2',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  ?.copyWith(
                                      color: kWhiteTextColor,
                                      fontWeight: FontWeight.bold),
                            ),
                            child: Tab(text: 'Cancel')),
                      ]),
                ),
              ),
            ),
          ),
          body: TabBarView(children: [
            HistoryAllView(),
            HistoryWaitingPaymentView(),
            HistoryOnGoingView(),
            HistoryCompletedView(),
            HistoryCancelView(),
          ])),
    );
  }
}

class HistoryAllView extends StatelessWidget {
  const HistoryAllView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(kPagePadding),
      itemCount: 20,
      itemBuilder: (context, index) {
        return CustomBookingCard(
          widget: 'history',
          cargoType: 'Air Freight',
          voyageRef: 'HA151R',
          placeDeparture: 'IDSRG',
          placeArrival: 'IDCGK',
          departureDay: 'Senin',
          arrivalDay: 'Selasa',
          departureDate: '23 Jun 2022',
          arrivalDate: '7 Jul 2022',
          duration: '2 Weeks',
          discount: '10%',
          carrier: 'hdh',
        );
      },
    );
  }
}

class HistoryWaitingPaymentView extends StatelessWidget {
  const HistoryWaitingPaymentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(kPagePadding),
      itemCount: 3,
      itemBuilder: (context, index) {
        return CustomBookingCard(
          widget: 'history',
          cargoType: 'Air Freight',
          voyageRef: 'HA151R',
          placeDeparture: 'IDSRG',
          placeArrival: 'IDCGK',
          departureDay: 'Senin',
          arrivalDay: 'Selasa',
          departureDate: '23 Jun 2022',
          arrivalDate: '7 Jul 2022',
          duration: '2 Weeks',
          discount: '10%',
          carrier: 'djd',
        );
      },
    );
  }
}

class HistoryOnGoingView extends StatelessWidget {
  const HistoryOnGoingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(kPagePadding),
      itemCount: 5,
      itemBuilder: (context, index) {
        return CustomBookingCard(
          widget: 'history',
          cargoType: 'Air Freight',
          voyageRef: 'HA151R',
          placeDeparture: 'IDSRG',
          placeArrival: 'IDCGK',
          departureDay: 'Senin',
          arrivalDay: 'Selasa',
          departureDate: '23 Jun 2022',
          arrivalDate: '7 Jul 2022',
          duration: '2 Weeks',
          discount: '10%',
          carrier: '',
        );
      },
    );
  }
}

class HistoryCompletedView extends StatelessWidget {
  const HistoryCompletedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(kPagePadding),
      itemCount: 10,
      itemBuilder: (context, index) {
        return CustomBookingCard(
          widget: 'history',
          cargoType: 'Air Freight',
          voyageRef: 'HA151R',
          placeDeparture: 'IDSRG',
          placeArrival: 'IDCGK',
          departureDay: 'Senin',
          arrivalDay: 'Selasa',
          departureDate: '23 Jun 2022',
          arrivalDate: '7 Jul 2022',
          duration: '2 Weeks',
          discount: '10%',
          carrier: 'kdk',
        );
      },
    );
  }
}

class HistoryCancelView extends StatelessWidget {
  const HistoryCancelView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(kPagePadding),
      itemCount: 2,
      itemBuilder: (context, index) {
        return CustomBookingCard(
          widget: 'history',
          cargoType: 'Air Freight',
          voyageRef: 'HA151R',
          placeDeparture: 'IDSRG',
          placeArrival: 'IDCGK',
          departureDay: 'Senin',
          arrivalDay: 'Selasa',
          departureDate: '23 Jun 2022',
          arrivalDate: '7 Jul 2022',
          duration: '2 Weeks',
          carrier: 'kdd',
        );
      },
    );
  }
}
