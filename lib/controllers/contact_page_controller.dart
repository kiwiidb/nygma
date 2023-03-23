import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nygma/controllers/auth_controller.dart';
import 'package:nygma/controllers/nostr.dart';
import 'package:nygma/controllers/shamir_controller.dart';

import '../models/nostr_profile.dart';

class ContactPageController extends GetxController {
  var contacts = <String, Profile>{}.obs;
  var shownContacts = <String, Profile>{}.obs;
  var selectedContacts = <String, Profile>{}.obs;
  var quorum = 2.obs;
  GetStorage contactBox = GetStorage('contacts');
  final TextEditingController searchLNAddressController =
      TextEditingController();
  final TextEditingController dmController = TextEditingController();

  @override
  void onInit() async {
    dmController.text = '''Hello fellow nostrich. I have chosen you to be part
of my most trusted circle. If you would be so kind to
be the guardian of one of my backup shards, you can find
it in the next message. Please send it to me in case I contact
you and you are sure it is me.''';
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

  bool isSelected(Profile c) {
    return selectedContacts.containsKey(c.pubkey);
  }

  void toggleSelected(Profile? c) {
    if (c == null) {
      return;
    }
    if (selectedContacts.containsKey(c.pubkey)) {
      selectedContacts.remove(c.pubkey);
    } else {
      selectedContacts[c.pubkey!] = c;
    }
  }

  int numberSelected() {
    return selectedContacts.length;
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
