import 'dart:async';

import 'package:get/get.dart';
import 'package:ntcdcrypto/ntcdcrypto.dart';

class ShamirController extends GetxController {
  SSS sss = SSS();
  final isBase64 = false;
  var shares = <String>[].obs;

  @override
  void onInit() async {
    super.onInit();
  }

  List<String> calculateShares(int minimum, int shares, String secret) {
    // List<String> create(int minimum, int shares, String secret, bool isBase64) {
    this.shares.value = sss.create(minimum, shares, secret, isBase64);
    return this.shares.value;
  }

  String combineShares(List<String> shares) {
    return sss.combine(shares, isBase64);
  }
}
