import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ketech_booking/utils/extension_image.dart';

import '../../../style/colors.dart';
import '../../../style/paddings.dart';

class CustomInvoiceCardItem extends StatelessWidget {
  const CustomInvoiceCardItem({
    Key? key,
    required this.invoiceNumber,
    required this.customer,
    required this.invoiceDate,
    required this.currencyRate,
    required this.kategori,
    required this.totalInvoice,
  }) : super(key: key);

  final String invoiceNumber,
      customer,
      invoiceDate,
      currencyRate,
      kategori,
      totalInvoice;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Center(
      child: Padding(
        padding: const EdgeInsets.all(kContentPadding),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    invoiceNumber,
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          color: kPrimaryColor,
                        ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 20,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Image.asset(
                          'paid_stamp'.png,
                        ),
                      ),
                    ))
              ],
            ),
            SizedBox(
              height: kContentPadding,
            ),
            Divider(
              height: 2,
              color: kSecondaryTextColor,
            ),
            SizedBox(
              height: kContentPadding,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Customer',
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            color: kPrimaryTextColor,
                          ),
                    ),
                    Text(
                      customer,
                      style: Theme.of(context).textTheme.subtitle2?.copyWith(
                            color: kPrimaryTextColor,
                          ),
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
                      'Invoice Date',
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            color: kPrimaryTextColor,
                          ),
                    ),
                    Text(
                      invoiceDate,
                      style: Theme.of(context).textTheme.subtitle2?.copyWith(
                            color: kPrimaryTextColor,
                          ),
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
                      'Kategori',
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            color: kPrimaryTextColor,
                          ),
                    ),
                    Text(
                      kategori,
                      style: Theme.of(context).textTheme.subtitle2?.copyWith(
                            color: kPrimaryTextColor,
                          ),
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
                      'Currency / Rate',
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            color: kPrimaryTextColor,
                          ),
                    ),
                    Text(
                      currencyRate,
                      style: Theme.of(context).textTheme.subtitle2?.copyWith(
                            color: kPrimaryTextColor,
                          ),
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
                      'Total Invoice',
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            color: kPrimaryTextColor,
                          ),
                    ),
                    Text(
                      'Rp${NumberFormat('#,###,###.00', 'id_ID').format(double.parse(totalInvoice))}',
                      style: Theme.of(context).textTheme.subtitle2?.copyWith(
                            color: kGreenColor,
                          ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
