// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../model/list_commodity.dart';
import '../model/simpan_booking.dart';

class CommodityController extends GetxController {
  var statuscommodity = false.obs;
  var namacommodity = ''.obs;
  var commodityId = ''.obs;
  var imoclass = ''.obs;
  late TextEditingController controllerhscode;
  late TextEditingController controllerunnumber;
  var listCommodityBooking = <ListCommodity>[].obs;
 
  var commodity = <Commodity>[].obs;
  int id = 0;

  @override
  void onInit() {
    controllerhscode = TextEditingController();
    controllerunnumber = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    controllerhscode.dispose();
    controllerunnumber.dispose();
    super.onClose();
  }

  void addListCommodity(
    commodityId,
      namacommodity, hscode, imoclass, statuscommodity, unnumber) {
    listCommodityBooking.add(ListCommodity(
        id: id,
        commodityId: commodityId,
        namacommodity: namacommodity.toString(),
        hscode: hscode,
        imoclass: imoclass,
        statuscommodity: statuscommodity,
        unnumber: unnumber));
        
    commodity.add(Commodity(
        commodity: commodityId,
        dangerous: statuscommodity,
        hsCode:hscode,
        imoClass: imoclass,
        unNumber: unnumber));

    id++;
  }

  ListCommodity listCommodityById(String id) {
    return listCommodityBooking.firstWhere((element) => element.id == id);
  }

  void edit(id, namacommodity, hscode, imoclass, statuscommodity, unnumber) {
    // var commodityC = Get.find<CommodityController>();
    // final ListCommodity listCommodityM = commodityC.listCommodityById(id);
    final listCommodity = listCommodityById(id);
    listCommodity.namacommodity = namacommodity;
    listCommodity.hscode = hscode;
    listCommodity.statuscommodity = statuscommodity;
    listCommodity.imoclass = imoclass;
    listCommodity.unnumber = unnumber;
    listCommodityBooking.refresh();
    Get.back();
  }

  Future<bool> deleteListCommodity(int id) async {
    bool _deleted = false;
    await Get.dialog(CupertinoAlertDialog(
      title: Text("DELETE"),
      actions: [
        CupertinoDialogAction(
            onPressed: () {
              Get.back();
            },
            child: Text("Cancel")),
        CupertinoDialogAction(
            onPressed: () async {
              listCommodityBooking.removeWhere((element) => element.id == id);
              _deleted = true;
              Get.back();
            },
            child: Text("OK")),
      ],
      content: Text("Apakah kamu yakin untuk menghapus data ini??"),
    ));

    return _deleted;
  }

  String? validateIMO(String value) {
    if (statuscommodity.isTrue) {
      if (value.isEmpty) {
        return "IMO Class harus diisi..!";
      }
    } else {
      if (!GetUtils.isUsername(value)) {
        return "Gunakan NIK atau NIM";
      }
    }
    return null;
  }
}
