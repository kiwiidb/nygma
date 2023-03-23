import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/lnurl_pay_service.dart';

class WrapperController extends GetxController {
  final PageController pageController = PageController(initialPage: 0);
  final LnUrlPayService lnUrlPayService = Get.put(LnUrlPayService());
  var currentPage = 0.obs;
  var priceString = "".obs;
  var moscowTimeString = "".obs;
  var currentDisplayString = "".obs;

  @override
  void onInit() async {
    var rate = await lnUrlPayService.getRate();
    priceString.value = "📈 ${rate.rateFloat!.floor()}";
    moscowTimeString.value = "🕑 ${(1e8 / rate.rateFloat!).floor()}";
    currentDisplayString.value = priceString.value;
    super.onInit();
  }

  switchDisplay() {
    if (currentDisplayString.value == priceString.value) {
      currentDisplayString.value = moscowTimeString.value;
    } else {
      currentDisplayString.value = priceString.value;
    }
  }

  onItemTapped(int index) {
    pageController.jumpToPage(index);
    currentPage.value = index;
    update();
  }

  String get pageIndexTitle {
    switch (currentPage.value) {
      case 0:
        return 'Contacts';
      case 1:
        return 'Notifications'.tr;
      default:
        return '';
    }
  }
}
