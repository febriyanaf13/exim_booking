import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/fa.dart';
import 'package:ketech_booking/controllers/shipmentC.dart';

import '../style/colors.dart';

class ShipmentDetailItem extends GetView<ShipmentController> {
  const ShipmentDetailItem({
    Key? key,
    this.packagingType,
    this.grossWeight,
    this.netWeight,
    this.meas,
    this.qty,
    this.width,
    this.length,
    this.height,
    this.statusMatric,
    this.onDelete,
  }) : super(key: key);

  final String? packagingType;
  final String? grossWeight;
  final String? netWeight;
  final String? meas;
  final String? qty;
  final String? width;
  final String? length;
  final String? height;
  final bool? statusMatric;
  final Function()? onDelete;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$packagingType  X $qty',
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  ?.copyWith(color: kPrimaryColor, fontWeight: FontWeight.bold),
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
              'Gross Weight',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Text(
              statusMatric == true ? '$grossWeight lbs' : '$grossWeight kg',
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Obx(() => controller.statusFCLLCL.isFalse
            ? Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Net Weight',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      Text(
                        statusMatric == true
                            ? '$netWeight lbs'
                            : '$netWeight kg',
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
                        'Meas',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      Text(
                       statusMatric == true
                            ? '$meas inch³'
                            : '$meas cbm',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ],
                  ),
                ],
              )
            : Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Length',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      Text(
                         statusMatric == true
                            ? '$length inch'
                            : '$length cm',
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
                        'Width',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      Text(
                         statusMatric == true
                            ? '$width inch'
                            : '$width cm',
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
                        'Height',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      Text(
                         statusMatric == true
                            ? '$height inch'
                            : '$height cm',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ],
                  ),
                ],
              )),
      ],
    );
  }
}
