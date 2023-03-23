import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nygma/controllers/nostr.dart';

import '../models/nostr_profile.dart';

class ContactPageController extends GetxController {
  var currentTabNumber = 0.obs;
  var contacts = <String, Profile>{}.obs;
  var shownContacts = <String, Profile>{}.obs;
  GetStorage contactBox = GetStorage('contacts');
  final TextEditingController searchLNAddressController =
      TextEditingController();

  @override
  void onInit() async {
    searchLNAddressController.addListener(
      () {
        if (searchLNAddressController.text == "") {
          shownContacts.addAll(contacts);
        }
        shownContacts.removeWhere((key, value) => !value.name!
            .toLowerCase()
            .startsWith(searchLNAddressController.text));
      },
    );
    await fetchContacts();
    super.onInit();
  }

  Future<void> fetchContacts() async {
    var keys = contactBox.getKeys();
    for (String key in keys) {
      Map<String, dynamic> cJson = contactBox.read(key);
      contacts[key] = Profile.fromJson(cJson);
      shownContacts[key] = Profile.fromJson(cJson);
    }
  }

  Future<void> storeContact(Profile c) async {
    await contactBox.write(c.pubkey!, c);
    contacts[c.pubkey!] = c;
    shownContacts[c.pubkey!] = c;
  }

  deleteContact(Profile value) async {
    await contactBox.remove(value.pubkey!);
  }
}
