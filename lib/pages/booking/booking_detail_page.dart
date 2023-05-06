// ignore_for_file: avoid_print, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/fa.dart';
import 'package:ketech_booking/components/custom_snackbar.dart';

import 'package:ketech_booking/controllers/bookingC.dart';
import 'package:ketech_booking/controllers/commodityC.dart';
import 'package:ketech_booking/controllers/partiesC.dart';
import 'package:ketech_booking/controllers/shipmentC.dart';
import 'package:ketech_booking/model/commodity.dart';

import '../../components/custom_app_bar.dart';
import '../../components/custom_dropdown.dart';
import '../../components/rounded_button.dart';
import '../../components/shipment_detail_item.dart';
import '../../style/borders.dart';
import '../../style/colors.dart';
import '../../style/paddings.dart';
import '../../utils/constants.dart';

class BookingDetailPage extends GetView<BookingController> {
  const BookingDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userData = storage.read('userData');
    var arg = Get.arguments;
    var partiesC = Get.put(PartiesController());
    var shipmentC = Get.put(ShipmentController());
    var commodityC = Get.put(CommodityController());

    return Scaffold(
      appBar: CustomSecondaryAppBar('Booking Detail'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(kPagePadding),
          child: Column(
            children: [
              AddCommodityDetail(
                data: controller.listCommodity,
              ),
              SizedBox(
                height: kContainerPadding,
              ),
              AddShipmentDetail(),
              SizedBox(
                height: kContainerPadding,
              ),
              AddAdditionalShipmentDetail(),
              SizedBox(
                height: kContainerPadding,
              ),
              PartiesDetail(),
              SizedBox(
                height: kContainerPadding,
              ),
              RoundedTextButton(
                text: 'Save',
                textColor: Colors.white,
                colorBackground: kPrimaryColor,
                onPressed: () {
                  Map data = {
                    'user_id': userData['userid'],
                    'transport_mode': arg['transport_mode'],
                    'quotation_number': arg['quotation'],
                    'sm_origin': arg['smOrigin'],
                    'sm_departure': arg['smDeparture'],
                    'port_loading': arg['port_loading'],
                    'port_discharge': arg['port_discharge'],
                    'date_departure': arg['date_departure'],
                    'date_arrival': arg['date_arrival'],
                    'schedule_id': arg['schedule_id'],
                    'carrier': arg['carrier'],
                    'shipper': partiesC.shipperEditingController.text,
                    'metric':
                        shipmentC.statusMatric.isTrue ? 'IMPERIAL' : 'METRIC',
                    'fcllcl': shipmentC.statusFCLLCL.isTrue ? 'LCL' : 'FCL',
                    'consignee': partiesC.consigneeEditingController.text,
                    'notify_party': partiesC.notifyPartyEditingController.text,
                    'payment_type': partiesC.paymentEditingController.text,
                    'payment_location':
                        partiesC.paymentLocationEditingController.text,
                    'notes': partiesC.notesEditingController.text,
                    'special_handling':
                        shipmentC.specialHandlingEditingController.text,
                    'cargo_pickup': shipmentC.statusCargoPickup.isTrue
                        ? shipmentC.cargoPickupTypeEditingController.text
                        : "",
                    'cargo_delivery': shipmentC.statusCargoDelivery.isTrue
                        ? shipmentC.cargoDeliveryEditingController.text
                        : "",
                    'cargo_insurance': shipmentC.statusCargoIncurance.isTrue
                        ? shipmentC.cargoInsuranceEditingController.text
                        : "",
                    'port_fee': shipmentC.statusPFFF.isTrue
                        ? shipmentC.portFeeEditingController.text
                        : "",
                    'custom_clearance': shipmentC.statusCustomClearances.isTrue
                        ? shipmentC.customClearanceEditingController.text
                        : "",
                    'list_commodity': commodityC.listCommodityBooking.value,
                    'listfcllcl': shipmentC.statusFCLLCL.isTrue
                        ? shipmentC.listLCL.value
                        : shipmentC.listFCL.value,
                    'commodities': commodityC.commodity.value
                  };
                  controller.simpanBooking(data);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddAdditionalShipmentDetail extends GetView<ShipmentController> {
  const AddAdditionalShipmentDetail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Additional Shipment Details',
            style: Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(color: kSecondaryTextColor),
          ),
          SizedBox(
            height: 5,
          ),
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(kDefaultBorder)),
            child: Padding(
              padding: const EdgeInsets.all(kContentPadding),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Cargo Pickup',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          Obx(() => FlutterSwitch(
                                height: 20,
                                valueFontSize: 10,
                                toggleSize: 10,
                                value: controller.statusCargoPickup.value,
                                borderRadius: 20,
                                padding: 5,
                                showOnOff: true,
                                activeText: 'On',
                                activeColor: kGreenColor,
                                inactiveText: 'Off',
                                inactiveColor: kPrimaryColor,
                                onToggle: (val) {
                                  controller.statusCargoPickup.value = val;
                                },
                              )),
                        ],
                      ),
                      Obx(() => controller.statusCargoPickup.isTrue
                          ? Column(
                              children: [
                                SizedBox(
                                  height: kContentPadding,
                                ),
                                TextFormField(
                                  controller: controller
                                      .cargoPickupTypeEditingController,
                                  minLines: 1,
                                  maxLines: 2,
                                    style: Theme.of(context).textTheme.bodyText2,

                                  decoration: InputDecoration(
                                      labelText: 'Enter adcress & zipcode...',
                                      alignLabelWithHint: true,
                                      labelStyle: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          ?.copyWith(
                                              color: kSecondaryTextColor)),
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  autofocus: true,
                                  keyboardType: TextInputType.text,
                                ),
                              ],
                            )
                          : SizedBox()),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Cargo Delivery',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          Obx(() => FlutterSwitch(
                                height: 20,
                                valueFontSize: 10,
                                toggleSize: 10,
                                value: controller.statusCargoDelivery.value,
                                borderRadius: 20,
                                padding: 5,
                                showOnOff: true,
                                activeText: 'On',
                                activeColor: kGreenColor,
                                inactiveText: 'Off',
                                inactiveColor: kPrimaryColor,
                                onToggle: (val) {
                                  controller.statusCargoDelivery.value = val;
                                },
                              )),
                        ],
                      ),
                      Obx(() => controller.statusCargoDelivery.isTrue
                          ? Column(
                              children: [
                                SizedBox(
                                  height: kContentPadding,
                                ),
                                TextFormField(
                                  controller:
                                      controller.cargoDeliveryEditingController,
                                  minLines: 1,
                                  maxLines: 2,
                                  style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                         ,
                                  decoration: InputDecoration(
                                      labelText: 'Enter adcress & zipcode...',
                                      alignLabelWithHint: true,
                                      labelStyle: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          ?.copyWith(
                                              color: kSecondaryTextColor)),
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  autofocus: true,
                                  keyboardType: TextInputType.text,
                                ),
                              ],
                            )
                          : SizedBox()),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Cargo Insurances',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          Obx(() => FlutterSwitch(
                                height: 20,
                                valueFontSize: 10,
                                toggleSize: 10,
                                value: controller.statusCargoIncurance.value,
                                borderRadius: 20,
                                padding: 5,
                                showOnOff: true,
                                activeText: 'On',
                                activeColor: kGreenColor,
                                inactiveText: 'Off',
                                inactiveColor: kPrimaryColor,
                                onToggle: (val) {
                                  controller.statusCargoIncurance.value = val;
                                },
                              )),
                        ],
                      ),
                      Obx(() => controller.statusCargoIncurance.isTrue
                          ? Column(
                              children: [
                                SizedBox(
                                  height: kContentPadding,
                                ),
                                TextFormField(
                                  controller: controller
                                      .cargoInsuranceEditingController,
                                  minLines: 1,
                                  maxLines: 2,
                                  style: Theme.of(context).textTheme.bodyText2,
                                  decoration: InputDecoration(
                                      labelText: 'Enter adcress & zipcode...',
                                      alignLabelWithHint: true,
                                      labelStyle: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          ?.copyWith(
                                              color: kSecondaryTextColor)),
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  autofocus: true,
                                  keyboardType: TextInputType.text,
                                ),
                              ],
                            )
                          : SizedBox()),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Port Fees & Forwarding Fees',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          Obx(() => FlutterSwitch(
                                height: 20,
                                valueFontSize: 10,
                                toggleSize: 10,
                                value: controller.statusPFFF.value,
                                borderRadius: 20,
                                padding: 5,
                                showOnOff: true,
                                activeText: 'On',
                                activeColor: kGreenColor,
                                inactiveText: 'Off',
                                inactiveColor: kPrimaryColor,
                                onToggle: (val) {
                                  controller.statusPFFF.value = val;
                                },
                              )),
                        ],
                      ),
                      Obx(() => controller.statusPFFF.isTrue
                          ? Column(
                              children: [
                                SizedBox(
                                  height: kContentPadding,
                                ),
                                TextFormField(
                                  controller:
                                      controller.portFeeEditingController,
                                  minLines: 1,
                                  maxLines: 2,
                                  style: Theme.of(context).textTheme.bodyText2,
                                  decoration: InputDecoration(
                                      labelText: 'Enter adcress & zipcode...',
                                      alignLabelWithHint: true,
                                      labelStyle: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          ?.copyWith(
                                              color: kSecondaryTextColor)),
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  autofocus: true,
                                  keyboardType: TextInputType.text,
                                ),
                              ],
                            )
                          : SizedBox()),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Custom Clearances',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          Obx(() => FlutterSwitch(
                                height: 20,
                                valueFontSize: 10,
                                toggleSize: 10,
                                value: controller.statusCustomClearances.value,
                                borderRadius: 20,
                                padding: 5,
                                showOnOff: true,
                                activeText: 'On',
                                activeColor: kGreenColor,
                                inactiveText: 'Off',
                                inactiveColor: kPrimaryColor,
                                onToggle: (val) {
                                  controller.statusCustomClearances.value = val;
                                },
                              )),
                        ],
                      ),
                      Obx(() => controller.statusCustomClearances.isTrue
                          ? Column(
                              children: [
                                SizedBox(
                                  height: kContentPadding,
                                ),
                                TextFormField(
                                  controller: controller
                                      .customClearanceEditingController,
                                  minLines: 1,
                                  maxLines: 2,
                                  style: Theme.of(context).textTheme.bodyText2,
                                  decoration: InputDecoration(
                                      labelText: 'Enter adcress & zipcode...',
                                      alignLabelWithHint: true,
                                      labelStyle: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          ?.copyWith(
                                              color: kSecondaryTextColor)),
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  autofocus: true,
                                  keyboardType: TextInputType.text,
                                ),
                              ],
                            )
                          : SizedBox())
                    ],
                  ),
                  SizedBox(
                    height: kElementPadding,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Special Handling',
                        style: Theme.of(context).textTheme.subtitle1?.copyWith(
                            color: kPrimaryColor, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: controller.specialHandlingEditingController,
                        minLines: 2,
                        maxLines: 5,
                        style: Theme.of(context).textTheme.bodyText2,
                        decoration: InputDecoration(
                            labelText: 'Your handling...',
                            alignLabelWithHint: true,
                            labelStyle: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.copyWith(color: kSecondaryTextColor)),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.text,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class AddCommodityDetail extends GetView<CommodityController> {
  AddCommodityDetail({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<ListCommodity> data;
  final shipmentC = Get.put(ShipmentController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Commodity Details',
            style: Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(color: kSecondaryTextColor),
          ),
          SizedBox(
            height: 5,
          ),
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(kDefaultBorder)),
            child: Padding(
              padding: const EdgeInsets.all(kContentPadding),
              child: Column(
                children: [
                  Obx(() => ListView.builder(
                        itemCount: controller.listCommodityBooking.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return CustomCommodityItem(
                            commodityname: controller
                                .listCommodityBooking[index].namacommodity,
                            commoditystatus: controller
                                .listCommodityBooking[index].statuscommodity,
                            hscode:
                                controller.listCommodityBooking[index].hscode,
                            imoclass:
                                controller.listCommodityBooking[index].imoclass,
                            unnumber:
                                controller.listCommodityBooking[index].unnumber,
                            onEdit: () {},
                            onDelete: () {
                              controller.deleteListCommodity(
                                  controller.listCommodityBooking[index].id!);
                            },
                          );
                        },
                      )),
                  RoundedTextButton(
                    text: 'Add',
                    textColor: Colors.white,
                    colorBackground: kPrimaryColor,
                    onPressed: () {
                      Get.bottomSheet(Container(
                        decoration: BoxDecoration(
                            color: kWhiteColor,
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20))),
                        child: SingleChildScrollView(
                          padding: EdgeInsets.all(kPagePadding),
                          child: Column(
                            children: [
                              CustomDropdownButton(
                                  height: kInputPadding,
                                  hint: 'Commodity',
                                  items: data.map((e) {
                                    return {
                                      'value': e.id!,
                                      'text': e.namaCommodity!
                                    };
                                  }).toList(),

                                  // validator: (value) =>
                                  // parkirC.validateTipeKen(
                                  //     value),
                                  onChangeValue: (value) {
                                    controller.commodityId.value =
                                        value.toString();
                                    // namacommodity = value.toString();
                                    var selectedData = data
                                        .where((element) => element.id == value)
                                        .toList();
                                    controller.namacommodity.value =
                                        selectedData
                                            .map((e) => e.namaCommodity)
                                            .toString();

                                    print(value);
                                  }),
                              SizedBox(
                                height: kElementPadding,
                              ),
                              TextFormField(
                                controller: controller.controllerhscode,
                                style: Theme.of(context).textTheme.bodyText2,
                                decoration: InputDecoration(
                                    labelText: 'HS Code',
                                    labelStyle:
                                        Theme.of(context).textTheme.bodyText2),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                keyboardType: TextInputType.text,
                              ),
                              SizedBox(
                                height: kElementPadding,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Commodity Type',
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1
                                        ?.copyWith(
                                            color: kPrimaryColor,
                                            fontWeight: FontWeight.bold),
                                  ),
                                  Obx(() => FlutterSwitch(
                                        width: 120,
                                        height: 30,
                                        valueFontSize: 13,
                                        toggleSize: 20,
                                        value: controller.statuscommodity.value,
                                        borderRadius: 10,
                                        padding: 8.0,
                                        showOnOff: true,
                                        activeText:
                                            controller.statuscommodity.isFalse
                                                ? 'Safe'
                                                : 'Dangerous',
                                        activeColor: kPrimaryColor,
                                        inactiveText:
                                            controller.statuscommodity.isFalse
                                                ? 'Safe'
                                                : 'Dangerous',
                                        inactiveColor: kGreenColor,
                                        onToggle: (val) {
                                          controller.statuscommodity.value =
                                              val;
                                          controller.statuscommodity.isFalse
                                              ? {
                                                  controller.controllerunnumber
                                                      .clear(),
                                                  controller.imoclass('')
                                                }
                                              : print(true);
                                        },
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: kElementPadding,
                              ),
                              Obx(() => controller.statuscommodity.isFalse
                                  ? Container()
                                  : Row(
                                      children: [
                                        Expanded(
                                          child: CustomDropdownButton(
                                              height: kInputPadding,
                                              hint: 'IMO Class',
                                              items: [
                                                {'value': '1.1', 'text': '1.1'},
                                                {'value': '1.2', 'text': '1.2'},
                                                {'value': '1.3', 'text': '1.3'},
                                                {'value': '1.4', 'text': '1.4'},
                                                {'value': '1.5', 'text': '1.5'},
                                                {'value': '1.6', 'text': '1.6'},
                                                {'value': '2.1', 'text': '2.1'},
                                                {'value': '2.2', 'text': '2.2'},
                                                {'value': '2.3', 'text': '2.3'},
                                                {'value': '3', 'text': '3'},
                                                {'value': '4.1', 'text': '4.1'},
                                                {'value': '4.2', 'text': '4.2'},
                                                {'value': '4.3', 'text': '4.3'},
                                                {'value': '5.1', 'text': '5.1'},
                                                {'value': '5.2', 'text': '5.2'},
                                                {'value': '6', 'text': '6'},
                                                {'value': '7', 'text': '7'},
                                                {'value': '8', 'text': '8'},
                                                {'value': '9', 'text': '9'}
                                              ],
                                              validator: (value) =>
                                                  controller.validateIMO(
                                                      value.toString()),
                                              onChangeValue: (value) {
                                                controller.imoclass.value =
                                                    value.toString();
                                              }),
                                        ),
                                        SizedBox(
                                          width: kElementPadding,
                                        ),
                                        Expanded(
                                          child: TextFormField(
                                            controller:
                                                controller.controllerunnumber,
                                                style: Theme.of(context)
                                                .textTheme
                                                .bodyText2,
                                            decoration: InputDecoration(
                                                labelText: 'UN Number',
                                                labelStyle: Theme.of(context)
                                                    .textTheme
                                                    .bodyText2),
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            keyboardType: TextInputType.text,
                                          ),
                                        ),
                                      ],
                                    )),
                              SizedBox(
                                height: kElementPadding,
                              ),
                              Obx(() => controller.namacommodity.isEmpty
                                  ? Container()
                                  : RoundedTextButton(
                                      text: 'Save',
                                      textColor: Colors.white,
                                      colorBackground: kPrimaryColor,
                                      onPressed: () {
                                        if (controller.statuscommodity.isTrue) {
                                          if (controller.imoclass.isEmpty) {
                                            snackbarWarning('Warning...',
                                                'IMO Class harus diisi');
                                          } else {
                                            controller.addListCommodity(
                                                controller.commodityId.value,
                                                controller.namacommodity,
                                                controller
                                                    .controllerhscode.text,
                                                controller.imoclass.value,
                                                controller
                                                    .statuscommodity.value,
                                                controller
                                                    .controllerunnumber.text);

                                            controller.namacommodity('');
                                            controller.controllerhscode.clear();
                                            controller.controllerunnumber
                                                .clear();
                                            controller.statuscommodity(false);
                                            controller.imoclass('');

                                            Get.back();
                                          }
                                        } else {
                                          controller.addListCommodity(
                                              controller.commodityId.value,
                                              controller.namacommodity,
                                              controller.controllerhscode.text,
                                              controller.imoclass.value,
                                              controller.statuscommodity.value,
                                              controller
                                                  .controllerunnumber.text);

                                          controller.namacommodity('');
                                          controller.controllerhscode.clear();
                                          controller.controllerunnumber.clear();
                                          controller.statuscommodity(false);
                                          controller.imoclass('');

                                          Get.back();
                                        }
                                      },
                                    ))
                            ],
                          ),
                        ),
                      ));
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomCommodityItem extends StatelessWidget {
  const CustomCommodityItem({
    Key? key,
    required this.commodityname,
    required this.commoditystatus,
    required this.hscode,
    required this.imoclass,
    required this.unnumber,
    this.onDelete,
    this.onEdit,
  }) : super(key: key);

  final String? commodityname;
  final bool? commoditystatus;
  final String? hscode;
  final String? imoclass;
  final String? unnumber;
  final Function()? onDelete;
  final Function()? onEdit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                commodityname ?? '-',
                style: Theme.of(context).textTheme.subtitle1?.copyWith(
                    color: kPrimaryColor, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kDefaultBorder),
                color: commoditystatus == true ? Colors.redAccent : kGreenColor,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Text(
                  commoditystatus == true ? 'Dangerous' : 'Safe',
                  style: Theme.of(context).textTheme.overline?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // GestureDetector(
                //   child: Iconify(
                //     Fa.edit,
                //     color: kWarningrColor,
                //     size: 20,
                //   ),
                //   onTap: onEdit,
                // ),
                // SizedBox(
                //   width: 5,
                // ),
                GestureDetector(
                  child: Iconify(
                    Fa.trash,
                    color: kErrorColor,
                    size: 20,
                  ),
                  onTap: onDelete,
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Divider(
          height: 2,
          color: kPrimaryTextColor,
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'HS Code',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Text(
              hscode == '' ? '-' : hscode!,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'IMO Class',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Text(
              imoclass == '' ? '-' : imoclass!,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'UN Number',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Text(
              unnumber == '' ? '-' : unnumber!,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        ),
        SizedBox(
          height: kContentPadding,
        ),
      ],
    );
  }
}

class AddShipmentDetail extends GetView<ShipmentController> {
  const AddShipmentDetail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Shipment Details',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(color: kSecondaryTextColor),
              ),
              SizedBox(
                width: kElementPadding,
              ),
              Obx(() => FlutterSwitch(
                    height: 30,
                    valueFontSize: 13,
                    toggleSize: 20,
                    value: controller.statusFCLLCL.value,
                    borderRadius: 10,
                    padding: 8.0,
                    showOnOff: true,
                    activeText: 'LCL',
                    activeColor: kPrimaryColor,
                    inactiveText: 'FCL',
                    inactiveColor: kGreenColor,
                    onToggle: (val) {
                      controller.statusFCLLCL.value = val;
                      controller.statusFCLLCL.isFalse
                          ? {
                              // controller.listShipmentBookingFCL.clear(),
                              controller.listShipmentBookingFCL.refresh()
                            }
                          : {
                              // controller.listShipmentBookingLCL.clear(),
                              controller.listShipmentBookingLCL.refresh()
                            };
                    },
                  )),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(kDefaultBorder)),
            child: Padding(
              padding: const EdgeInsets.all(kContentPadding),
              child: Column(
                children: [
                  Obx(() => ListView.builder(
                      itemCount: controller.statusFCLLCL.isTrue
                          ? controller.listShipmentBookingLCL.length
                          : controller.listShipmentBookingFCL.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            controller.statusFCLLCL.isTrue
                                ? ShipmentDetailItem(
                                    statusMatric: controller
                                        .listShipmentBookingLCL[index]
                                        .statusMatric,
                                    packagingType: controller
                                        .listShipmentBookingLCL[index]
                                        .containerType,
                                    grossWeight: controller
                                        .listShipmentBookingLCL[index]
                                        .grossWeight,
                                    height: controller
                                        .listShipmentBookingLCL[index].height,
                                    length: controller
                                        .listShipmentBookingLCL[index].length,
                                    qty: controller
                                        .listShipmentBookingLCL[index].qty,
                                    width: controller
                                        .listShipmentBookingLCL[index].width,
                                    onDelete: () {
                                      controller.deleteListShipmentBookingLCL(
                                          controller
                                              .listShipmentBookingLCL[index]
                                              .id!);
                                    },
                                  )
                                : ShipmentDetailItem(
                                    statusMatric: controller
                                        .listShipmentBookingFCL[index]
                                        .statusMatric,
                                    packagingType: controller
                                        .listShipmentBookingFCL[index]
                                        .containerType,
                                    grossWeight: controller
                                        .listShipmentBookingFCL[index]
                                        .grossWeight,
                                    netWeight: controller
                                        .listShipmentBookingFCL[index]
                                        .netWeight,
                                    meas: controller
                                        .listShipmentBookingFCL[index].meas,
                                    qty: controller
                                        .listShipmentBookingFCL[index].qty,
                                    onDelete: () {
                                      controller.deleteListShipmentBookingFCL(
                                          controller
                                              .listShipmentBookingFCL[index]
                                              .id!);
                                    },
                                  ),
                            SizedBox(
                              height: kElementPadding,
                            ),
                          ],
                        );
                      })),
                  RoundedTextButton(
                    text: 'Add',
                    textColor: Colors.white,
                    colorBackground: kPrimaryColor,
                    onPressed: () {
                      customAddShipmentDetail(controller.statusFCLLCL,
                          controller.statusMatric, context);
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<dynamic> customAddShipmentDetail(
      RxBool statusFCLLCL, RxBool statusMatric, BuildContext context) {
    return Get.bottomSheet(Container(
      decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(kPagePadding),
        child: Column(
          children: [
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FlutterSwitch(
                    height: 30,
                    width: 100,
                    valueFontSize: 13,
                    toggleSize: 20,
                    value: statusMatric.value,
                    borderRadius: 10,
                    padding: 8.0,
                    showOnOff: true,
                    activeText: 'Imperal',
                    activeColor: kPrimaryColor,
                    inactiveText: 'Matric',
                    inactiveColor: kGreenColor,
                    onToggle: (val) {
                      statusMatric.value = val;
                      controller.statusMatric.isTrue
                          ? controller.satuanWeight('lbs')
                          : controller.satuanWeight('kg');
                      controller.statusMatric.isTrue
                          ? controller.satuanMeas('inch³')
                          : controller.satuanMeas('cbm');
                      controller.statusMatric.isTrue
                          ? controller.satuanDimension('inch')
                          : controller.satuanDimension('cm');
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: kElementPadding,
            ),
            Obx(
              () => statusFCLLCL.isFalse
                  ? Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: CustomDropdownButton(
                                  height: kInputPadding,
                                  textStyle:
                                      Theme.of(context).textTheme.bodyText2,
                                  hint: 'Container Type',
                                  items: controller.listContainer
                                      .map((e) => {
                                            'value': e.id!,
                                            'text': e.tipeContainer!
                                          })
                                      .toList(),
                                  // validator: (value) =>
                                  // parkirC.validateTipeKen(
                                  //     value),
                                  onChangeValue: (value) {
                                    controller.sizeEditingController.text =
                                        value.toString();
                                    var selectedData = controller.listContainer
                                        .where((element) => element.id == value)
                                        .toList();
                                    controller.containerTypeEditingController
                                            .text =
                                        selectedData
                                            .map((e) => e.tipeContainer)
                                            .toString();
                                  }),
                            ),
                            SizedBox(
                              width: kElementPadding,
                            ),
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                controller: controller.qtyEditingController,
                                style: Theme.of(context).textTheme.bodyText2,
                                decoration: InputDecoration(
                                    labelText: 'QTY',
                                    labelStyle:
                                        Theme.of(context).textTheme.bodyText2),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: kElementPadding,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller:
                                    controller.grossWeightEditingController,
                                    style: Theme.of(context).textTheme.bodyText2,
                                decoration: InputDecoration(
                                    suffix: Text(
                                        statusMatric.isTrue ? 'lbs' : 'kg'),
                                    labelText: 'Gross Weight',
                                    labelStyle:
                                        Theme.of(context).textTheme.bodyText2),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            SizedBox(
                              width: kElementPadding,
                            ),
                            Expanded(
                              child: TextFormField(
                                controller:
                                    controller.netWeightEditingController,
                                    style: Theme.of(context).textTheme.bodyText2,
                                decoration: InputDecoration(
                                    suffix: Text(
                                        statusMatric.isTrue ? 'lbs' : 'kg'),
                                    labelText: 'Net Weight',
                                    labelStyle:
                                        Theme.of(context).textTheme.bodyText2),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            SizedBox(
                              width: kElementPadding,
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: controller.measEditingController,
                                style: Theme.of(context).textTheme.bodyText2,
                                decoration: InputDecoration(
                                    suffix: Text(
                                        statusMatric.isTrue ? 'inch³' : 'cbm'),
                                    labelText: 'Meas',
                                    labelStyle:
                                        Theme.of(context).textTheme.bodyText2),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: CustomDropdownButton(
                                  height: kInputPadding,
                                  textStyle:
                                      Theme.of(context).textTheme.bodyText2,
                                  hint: 'Packaging',
                                  items: controller.listPackaging
                                      .map((e) =>
                                          {'value': e.packId!, 'text': e.nama!})
                                      .toList(),
                                  // validator: (value) =>
                                  // parkirC.validateTipeKen(
                                  //     value),
                                  onChangeValue: (value) {
                                    var selectedData = controller.listPackaging
                                        .where((element) =>
                                            element.packId == value)
                                        .toList();
                                    controller.packagingEditingController.text =
                                        selectedData
                                            .map((e) => e.nama)
                                            .toString();
                                  }),
                            ),
                            SizedBox(
                              width: kElementPadding,
                            ),
                            Expanded(
                              flex: 2,
                              child: TextFormField(
                                controller:
                                    controller.grossWeightEditingController,
                                    style: Theme.of(context).textTheme.bodyText2,
                                decoration: InputDecoration(
                                    suffix: Text(
                                        statusMatric.isTrue ? 'lbs' : 'kg'),
                                    labelText: 'Gross Weight',
                                    labelStyle:
                                        Theme.of(context).textTheme.bodyText2),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            SizedBox(
                              width: kElementPadding,
                            ),
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                controller: controller.qtyEditingController,
                                style: Theme.of(context).textTheme.bodyText2,
                                decoration: InputDecoration(
                                    labelText: 'QTY',
                                    labelStyle:
                                        Theme.of(context).textTheme.bodyText2),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: kElementPadding,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                controller: controller.lengthEditingController,
                                style: Theme.of(context).textTheme.bodyText2,
                                decoration: InputDecoration(
                                    suffix: Text(
                                        statusMatric.isTrue ? 'inch' : 'cm'),
                                    labelText: 'Length',
                                    labelStyle:
                                        Theme.of(context).textTheme.bodyText2),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            SizedBox(
                              width: kElementPadding,
                            ),
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                controller: controller.widthEditingController,
                                style: Theme.of(context).textTheme.bodyText2,
                                decoration: InputDecoration(
                                    suffix: Text(
                                        statusMatric.isTrue ? 'inch' : 'cm'),
                                    labelText: 'Width',
                                    labelStyle:
                                        Theme.of(context).textTheme.bodyText2),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            SizedBox(
                              width: kElementPadding,
                            ),
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                controller: controller.heightEditingController,
                                style: Theme.of(context).textTheme.bodyText2,
                                decoration: InputDecoration(
                                    suffix: Text(
                                        statusMatric.isTrue ? 'inch' : 'cm'),
                                    labelText: 'Height',
                                    labelStyle:
                                        Theme.of(context).textTheme.bodyText2),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
            ),
            SizedBox(
              height: kElementPadding,
            ),
            RoundedTextButton(
              text: 'Save',
              textColor: Colors.white,
              colorBackground: kPrimaryColor,
              onPressed: () {
                controller.statusFCLLCL.isTrue
                    ? controller.addListShipmentDetailsLCL()
                    : controller.addListShipmentDetailsFCL();
                Get.back();
              },
            ),
          ],
        ),
      ),
    ));
  }
}

class PartiesDetail extends GetView<PartiesController> {
  const PartiesDetail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bookingC = Get.put(BookingController());
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Parties Details',
            style: Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(color: kSecondaryTextColor),
          ),
          SizedBox(
            height: 5,
          ),
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(kDefaultBorder)),
            child: Padding(
                padding: const EdgeInsets.all(kContentPadding),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Shipper',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        CustomDropdownButton(
                            height: kInputPadding,
                            textStyle: Theme.of(context).textTheme.bodyText2,
                            hint: 'Select',
                            items: controller.listShipper
                                .map((e) =>
                                    {'value': e.id!, 'text': e.namaCustomer!})
                                .toList(),
                            // validator: (value) =>
                            // parkirC.validateTipeKen(
                            //     value),
                            onChangeValue: (value) {
                              controller.shipperEditingController.text =
                                  value.toString();
                            }),
                      ],
                    ),
                    SizedBox(
                      height: kContentPadding,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Consignee',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        CustomDropdownButton(
                            height: kInputPadding,
                            textStyle: Theme.of(context).textTheme.bodyText2,
                            hint: 'Select',
                            items: controller.listShipper
                                .map((e) =>
                                    {'value': e.id!, 'text': e.namaCustomer!})
                                .toList(),
                            // validator: (value) =>
                            // parkirC.validateTipeKen(
                            //     value),
                            onChangeValue: (value) {
                              controller.consigneeEditingController.text =
                                  value.toString();
                            }),
                      ],
                    ),
                    SizedBox(
                      height: kContentPadding,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Notify Party',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        CustomDropdownButton(
                            height: kInputPadding,
                            textStyle: Theme.of(context).textTheme.bodyText2,
                            hint: 'Select',
                            items: controller.listShipper
                                .map((e) =>
                                    {'value': e.id!, 'text': e.namaCustomer!})
                                .toList(),
                            // validator: (value) =>
                            // parkirC.validateTipeKen(
                            //     value),
                            onChangeValue: (value) {
                              controller.notifyPartyEditingController.text =
                                  value.toString();
                            }),
                      ],
                    ),
                    SizedBox(
                      height: kContentPadding,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Payment',
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              CustomDropdownButton(
                                  height: kInputPadding,
                                  textStyle:
                                      Theme.of(context).textTheme.bodyText2,
                                  hint: 'Select',
                                  items: [
                                    {'value': 'PREPAID', 'text': 'PREPAID'},
                                    {'value': 'COLLECT', 'text': 'COLLECT'},
                                  ],
                                  // validator: (value) =>
                                  // parkirC.validateTipeKen(
                                  //     value),
                                  onChangeValue: (value) {
                                    controller.paymentEditingController.text =
                                        value.toString();
                                  }),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: kContentPadding,
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Payment Location',
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              CustomDropdownButton(
                                  height: kInputPadding,
                                  textStyle:
                                      Theme.of(context).textTheme.bodyText2,
                                  hint: 'Select',
                                  items: bookingC.listKota
                                      .map((e) => {
                                            'value': e.unCode!,
                                            'text': e.namaKota!
                                          })
                                      .toList(),
                                  // validator: (value) =>
                                  // parkirC.validateTipeKen(
                                  //     value),
                                  onChangeValue: (value) {
                                    controller.paymentLocationEditingController
                                        .text = value.toString();
                                  }),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: kElementPadding,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Notes',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: controller.notesEditingController,
                          minLines: 2,
                          maxLines: 5,
                                    style: Theme.of(context).textTheme.bodyText2,

                          decoration: InputDecoration(
                              labelText: 'Your notes...',
                              alignLabelWithHint: true,
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  ?.copyWith(color: kSecondaryTextColor)),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.text,
                        ),
                      ],
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
