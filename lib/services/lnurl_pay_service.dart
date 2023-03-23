import 'dart:async';
import 'dart:convert';
import 'package:nygma/models/ln_url_secondary.dart';
import 'package:nygma/models/lnurlPrimary.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/rate.dart';

class LnUrlPayService {
  static var client = http.Client();

  Future<LnUrlPrimary> lnAddressCall(String address) async {
    var parts = address.split("@");
    if (parts.length != 2) {
      Get.snackbar(
          "Wrong format LN address", "The address $address is badly formatted");
    }
    var host = parts[1];
    var username = parts[0];
    return lnUrlPay(host, "/.well-known/lnurlp/$username");
  }

  Future<LnUrlPrimary> lnUrlPay(String host, String path) async {
    var uri = Uri.https(host, path);
    try {
      var response = await client.get(uri);
      if (response.statusCode != 200) {
        Get.snackbar("Something went wrong",
            "There was an error handling your request. Please check if the address is correct.",
            snackPosition: SnackPosition.BOTTOM);
        throw ("There was an error fetching the lnurl data");
      } else {
        return LnUrlPrimary.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      Get.snackbar("Something went wrong",
          "There was an error handling your request. Please check if the address is correct.",
          snackPosition: SnackPosition.BOTTOM);
      throw ("There was an error fetching the lnurl data");
    }
  }

  Future<LnUrlSecondary> fetchInvoice(String callback, int satAmt) async {
    var milliSatAmt = satAmt * 1000;
    var uriCallback = Uri.parse(callback);
    var queryParams = new Map<String, String>.from(uriCallback.queryParameters);
    queryParams["amount"] = "$milliSatAmt";
    var modifiedCallBack =
        Uri.https(uriCallback.authority, uriCallback.path, queryParams);
    try {
      var response = await client.get(modifiedCallBack);
      if (response.statusCode != 200) {
        Get.snackbar("Something went wrong",
            "There was an error handling your request. Please try again. If the problem persists please contact support",
            snackPosition: SnackPosition.BOTTOM);
        throw ("There was an error fetching the lnurl data");
      } else {
        return LnUrlSecondary.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      Get.snackbar("Something went wrong",
          "There was an error handling your request. Please try again. If the problem persists please contact support",
          snackPosition: SnackPosition.BOTTOM);
      throw ("There was an error fetching the lnurl data");
    }
  }

  //todo multi currency
  Future<Rate> getRate() async {
    var url = Uri.parse('https://getalby.com/api/rates/eur');
    var res = await http.get(url);
    if (res.statusCode != 200) {
      throw Exception('http.get error: statusCode= ${res.statusCode}');
    }
    return Rate.fromJson(jsonDecode(res.body));
  }
}
