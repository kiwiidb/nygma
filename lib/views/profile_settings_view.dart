import 'package:dart_bech32/dart_bech32.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:nygma/components/buttons/gradient_button.dart';

import '../components/labeled_text_form_field.dart';
import '../constants/app_constants.dart';
import '../constants/colors.dart';
import '../controllers/auth_controller.dart';
import 'package:flutter/services.dart';

class ProfileSettingsView extends StatelessWidget {
  ProfileSettingsView({super.key});

  final AuthController controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(gradient: kBgGradient),
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
                padding: AppConstants.contentPadding,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Account keys',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Text(
                          "${controller.npub.value.substring(0, 16)}...",
                          style: const TextStyle(fontSize: 21),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          width: 150,
                          child: GradientButton(
                            onPressed: () async {
                              controller.copyNsec();
                            },
                            child: const Text("Copy private key"),
                          ),
                        )
                      ]),
                )),
          ),
        ],
      ),
    );
  }
}

String extractHost(String lnAddress) {
  return lnAddress.replaceAll(RegExp(".*@"), "");
}
