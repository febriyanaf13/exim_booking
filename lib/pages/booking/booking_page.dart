import 'package:find_dropdown/find_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ri.dart';
import 'package:iconify_flutter/icons/uiw.dart';
import 'package:ketech_booking/utils/extension_image.dart';
import '../../components/custom_app_bar.dart';
import '../../components/custom_datepicker_dialog.dart';
import '../../components/custom_dropdown.dart';
import '../../components/rounded_button.dart';
import '../../controllers/bookingC.dart';
import '../../style/borders.dart';
import '../../style/colors.dart';
import '../../style/paddings.dart';

class BookingPage extends GetView<BookingController> {
  BookingPage({Key? key}) : super(key: key);

  final RxString loading = ''.obs;
  final RxString discharge = ''.obs;
  final RxString deliveryDate = '2022-09-07'.obs;
  final RxString arrivedDate = '2022-09-24'.obs;
  final RxString transportMode = ''.obs;
  final RxString carrier = ''.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomPrimaryAppBar('Booking'),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              width: Get.width,
              height: Get.height * 0.3,
              child: ColorFiltered(
                colorFilter: const ColorFilter.mode(
                  Colors.red,
                  BlendMode.hue,
                ),
                child: Container(
                  decoration: BoxDecoration(
                      color: kBackgroundColor,
                      image:
                          DecorationImage(image: AssetImage('bg-booking'.png))),
                ),
              ),
            ),
            Positioned(
                top: Get.height * 0.2,
                width: Get.width,
                height: Get.height * 0.64,
                child: Padding(
                  padding: const EdgeInsets.all(kPagePadding),
                  child: Container(
                      padding: const EdgeInsets.all(kElementPadding),
                      width: Get.width,
                      decoration: BoxDecoration(
                          color: kWhiteColor,
                          borderRadius: BorderRadius.circular(kDefaultBorder)),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Obx(() => FindDropdown(
                                  items: controller.listKota
                                      .map((element) =>
                                          '${element.unCode} - ${element.namaKota}')
                                      .toList(),
                                  // ignore: avoid_print
                                  onChanged: (items) {
                                    loading.value =
                                        items.toString().substring(0, 5);
                                  },
                                  selectedItem: 'Loading',
                                  label: "From",
                                  labelStyle: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      ?.copyWith(color: kPrimaryColor),
                                  searchBoxDecoration: InputDecoration(
                                    labelText: "Find Loading City",
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    labelStyle:
                                        Theme.of(context).textTheme.bodyText2,
                                    prefixIcon: Icon(
                                      Icons.search,
                                    ),
                                  ),
                                  labelVisible: false,
                                )),
                            Padding(
                              padding: const EdgeInsets.all(kContentPadding),
                              child: Iconify(Ri.arrow_up_down_line,
                                  color: kAccentColor),
                            ),
                            FindDropdown(
                              titleStyle:
                                  TextStyle(overflow: TextOverflow.ellipsis),
                              items: controller.listKota
                                  .map((element) =>
                                      '${element.unCode} - ${element.namaKota}')
                                  .toList(),
                              // ignore: avoid_print
                              onChanged: (items) =>
                                  discharge.value = items.toString(),
                              selectedItem: "Dishcarge",
                              label: "To",
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  ?.copyWith(color: kPrimaryColor),
                              searchBoxDecoration: InputDecoration(
                                labelText: "Find Discharge City",
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                labelStyle:
                                    Theme.of(context).textTheme.bodyText2,
                                prefixIcon: Icon(
                                  Icons.search,
                                ),
                              ),
                              labelVisible: false,
                            ),
                            SizedBox(height: kContentPadding),
                            Row(
                              children: [
                                CustomDateTimePickerDialog(
                                  text: 'Tanggal Kirim',
                                  onDataChange: (value) {
                                    if (value != null) {
                                      deliveryDate.value = value;
                                    }
                                  },
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.all(kContentPadding),
                                  child: Iconify(Uiw.date, color: kAccentColor),
                                ),
                                CustomDateTimePickerDialog(
                                  text: 'Tanggal Sampai',
                                  onDataChange: (value) {
                                    if (value != null) {
                                      arrivedDate.value = value;
                                    }
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: kContentPadding),
                            Obx(() => FindDropdown(
                                  items: controller.listTransportMode
                                      .map((element) =>
                                          element.activityName.toString())
                                      .toList(),
                                  // ignore: avoid_print
                                  onChanged: (items) {
                                    transportMode.value = items.toString();
                                  },
                                  selectedItem: "Transpot Mode",
                                  label: "Transport Mode",
                                  labelStyle: Get.textTheme.titleMedium?.copyWith(color: kPrimaryColor),
                                  searchBoxDecoration: InputDecoration(
                                    labelText: "Find Transport Mode",
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    labelStyle:
                                        Get.textTheme.titleSmall,
                                    prefixIcon: Icon(
                                      Icons.search,
                                    ),
                                  ),
                                  labelVisible: false,
                                )),
                            SizedBox(height: kContentPadding),
                            Obx(() => CustomDropdownButton(
                                  height: 40,
                                  hint: 'Carriers',
                                  items: controller.listCarrier.map((e) {
                                    return {
                                      'value': e.id!,
                                      'text': e.namaCustomer!
                                    };
                                  }).toList(),
                                  onChangeValue: (value) {
                                    carrier.value = value.toString();
                                  },
                                )),
                            SizedBox(height: kContentPadding),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Quotation',
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                                SizedBox(width: kContentPadding),
                                Obx(() => FlutterSwitch(
                                      height: 20,
                                      width: 50,
                                      valueFontSize: 10,
                                      toggleSize: 10,
                                      value: controller.statusQuotation.value,
                                      borderRadius: 20,
                                      padding: 5,
                                      showOnOff: true,
                                      activeText: 'On',
                                      activeColor: kGreenColor,
                                      inactiveText: 'Off',
                                      inactiveColor: kPrimaryColor,
                                      onToggle: (val) {
                                        controller.statusQuotation.value = val;
                                      },
                                    )),
                              ],
                            ),
                            Obx(() => controller.statusQuotation.isTrue
                                ? Column(
                                    children: [
                                      SizedBox(height: kContentPadding),
                                      TextFormField(
                                        controller: controller
                                            .quotationEditingController,
                                        minLines: 1,
                                        maxLines: 2,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                        decoration: InputDecoration(
                                            labelText:
                                                'Enter Quottaion Number...',
                                            alignLabelWithHint: true,
                                            labelStyle: Theme.of(context)
                                                .textTheme
                                                .bodyText2
                                                ?.copyWith(
                                                    color:
                                                        kSecondaryTextColor)),
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        autofocus: true,
                                        keyboardType: TextInputType.text,
                                      ),
                                    ],
                                  )
                                : SizedBox()),
                            SizedBox(height: kContentPadding),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Service Mode',
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                                SizedBox(width: kContentPadding),
                                Obx(() => FlutterSwitch(
                                      height: 20,
                                      width: 50,
                                      valueFontSize: 10,
                                      toggleSize: 10,
                                      value: controller.statusServiceMode.value,
                                      borderRadius: 20,
                                      padding: 5,
                                      showOnOff: true,
                                      activeText: 'On',
                                      activeColor: kGreenColor,
                                      inactiveText: 'Off',
                                      inactiveColor: kPrimaryColor,
                                      onToggle: (val) {
                                        controller.statusServiceMode.value =
                                            val;
                                      },
                                    )),
                              ],
                            ),
                            Obx(() => controller.statusServiceMode.isTrue
                                ? Column(
                                    children: [
                                      SizedBox(height: kContentPadding),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: CustomDropdownButton(
                                              height: 40,
                                              hint: 'Origin',
                                              items: [
                                                {
                                                  'value': 'CY',
                                                  'text': 'Container Yard (CY)'
                                                },
                                                {
                                                  'value': 'SD',
                                                  'text': 'Store Door (SD)'
                                                }
                                              ],
                                              onChangeValue: (value) {
                                                controller
                                                    .serviceModeOriginTextEditingController
                                                    .text = value.toString();
                                              },
                                            ),
                                          ),
                                          SizedBox(width: kContentPadding),
                                          Expanded(
                                            child: CustomDropdownButton(
                                              height: 40,
                                              hint: 'Departure',
                                              items: [
                                                {
                                                  'value': 'CY',
                                                  'text': 'Container Yard (CY)'
                                                },
                                                {
                                                  'value': 'SD',
                                                  'text': 'Store Door (SD)'
                                                }
                                              ],
                                              onChangeValue: (value) {
                                                controller
                                                    .serviceModeDepartureTextEditingController
                                                    .text = value.toString();
                                              },
                                            ),
                                          ),
                                          SizedBox(height: kContentPadding),
                                        ],
                                      ),
                                      SizedBox(height: kContentPadding),
                                    ],
                                  )
                                : SizedBox()),
                            SizedBox(height: kContentPadding),
                            RoundedTextButton(
                              text: "Search",
                              textColor: Colors.white,
                              colorBackground: kPrimaryColor,
                              onPressed: () {
                                controller.getSchedule(
                                    loading.value,
                                    discharge.value,
                                    deliveryDate.value,
                                    arrivedDate.value,
                                    transportMode.value,
                                    carrier.value);
                              },
                            ),
                          ],
                        ),
                      )),
                )),
          ],
        ),
      ),
    );
  }
}
