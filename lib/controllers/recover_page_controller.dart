import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecoverPageController extends GetxController {
  var shardControllerList = <TextEditingController>[
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ].obs;

  void addShare() {
    shardControllerList.add(TextEditingController());
  }

  List<String> getShares() {
    List<String> stringList = [];

    for (var controller in shardControllerList) {
      stringList.add(controller.text);
    }

    return stringList;
  }

  void removeShare() {
    if (shardControllerList.length != 1) {
      shardControllerList.removeLast();
    }
  }
}
