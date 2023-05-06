import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ketech_booking/components/custom_app_bar.dart';
import 'package:ketech_booking/style/paddings.dart';
import '../../controllers/invoiceC.dart';
import 'components/custom_invoice_card_item.dart';

class InvoicePage extends GetView<InvoiceController> {
  const InvoicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomPrimaryAppBar('Invoice'),
        body: SafeArea(
            child: SizedBox(
                height: Get.height,
                width: Get.width,
                child: ListView.builder(
                    itemCount: controller.listInvoice.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(
                        right: kPagePadding,
                        bottom: kPagePadding,
                        left: kPagePadding),
                    itemBuilder: (context, index) {
                      return CustomInvoiceCardItem(
                          invoiceNumber:
                              controller.listInvoice[index].invoiceNo!,
                          customer:
                              controller.listInvoice[index].customer!.nama!,
                          invoiceDate: DateFormat('dd-MM-yyyy')
                              .format(controller.listInvoice[index].invDate!)
                              .toString(),
                          currencyRate:
                              controller.listInvoice[index].curr!.currency! +
                                  '/' +
                                  controller.listInvoice[index].currencyRate!,
                          kategori: controller.listInvoice[index].keterangan!,
                          totalInvoice:
                              controller.listInvoice[index].grandTotal!);
                    }))));
  }
}
