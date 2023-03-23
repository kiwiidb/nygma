import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:dart_bech32/dart_bech32.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nostr/nostr.dart';

import '../models/nostr_profile.dart' as nostr_models;

class AuthController extends GetxController with WidgetsBindingObserver {
  final TextEditingController pubkeyController = TextEditingController();
  final TextEditingController privkeyController = TextEditingController();
  var pubkey = "".obs;
  var npub = "".obs;
  var isLoading = false.obs;
  var profile = nostr_models.Profile().obs;
  late Keychain keychain;
  GetStorage accountStorage = GetStorage("identity");

  @override
  void onInit() async {
    var pk = await accountStorage.read("identity-pubkey-hex");
    if (pk != "" && pk != null) {
      pubkey.value = pk;
    }
    var npub = await accountStorage.read("identity-pubkey-npub");
    if (pk != "" && pk != null) {
      this.npub.value = npub;
    }
    var privkeyhex = await accountStorage.read("identity-privkey-hex");
    if (privkeyhex != "" && privkeyhex != null) {
      keychain = Keychain(privkeyhex);
    }
    super.onInit();
  }

  void copyNsec() async {
    var privkeyBytes = hex.decode(keychain.private);
    var nsec = bech32.encode(Decoded(
        prefix: "nsec",
        words: bech32.toWords(Uint8List.fromList(privkeyBytes))));
    await Clipboard.setData(ClipboardData(text: nsec));
  }

  void loginHex(String privkeyHex) async {
    await accountStorage.write("identity-privkey-hex", privkeyHex);
    keychain = Keychain(privkeyHex);
    await accountStorage.write("identity-pubkey-hex", keychain.public);
    var npub = bech32.encode(Decoded(
        prefix: "npub",
        words:
            bech32.toWords(Uint8List.fromList(hex.decode(keychain.public)))));
    await accountStorage.write("identity-pubkey-npub", npub);
    pubkey.value = keychain.public;
    this.npub.value = npub;
  }

  void loginNsec(String nsec) async {
    try {
      var decoded = bech32.decode(nsec);
      var privkeyBytes = bech32.fromWords(decoded.words);
      var privkeyHex = hex.encode(privkeyBytes);
      loginHex(privkeyHex);
    } catch (e) {
      Get.snackbar("Invalid public key", e.toString(),
          snackPosition: SnackPosition.TOP);
      return;
    }
  }
}
