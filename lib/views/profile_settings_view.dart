import 'package:dart_bech32/dart_bech32.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../components/labeled_text_form_field.dart';
import '../constants/app_constants.dart';
import '../constants/colors.dart';
import '../controllers/auth_controller.dart';

class ProfileSettingsView extends StatelessWidget {
  ProfileSettingsView({super.key});

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
              child: GetX<AuthController>(builder: (controller) {
                var contact = controller.profile.value;
                if (contact.name == null ||
                    contact.lud16 == null ||
                    contact.pubkey == null) {
                  return const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Fetching profile.."),
                  );
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Profile & Settings',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            contact.picture,
                            width: 100,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                contact.name!,
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "⚡ ${extractHost(contact.lud16!)} ",
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30.0),
                      child: Text(
                        "${controller.npub.value.substring(0, 14)}..",
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

String extractHost(String lnAddress) {
  return lnAddress.replaceAll(RegExp(".*@"), "");
}
