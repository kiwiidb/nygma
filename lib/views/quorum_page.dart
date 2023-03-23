import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nygma/app_theme.dart';
import 'package:nygma/controllers/contact_page_controller.dart';

import '../components/buttons/gradient_button.dart';
import '../components/labeled_text_form_field.dart';
import '../constants/colors.dart';
import '../controllers/nostr.dart';
import '../controllers/recover_page_controller.dart';

class QuorumPage extends StatelessWidget {
  QuorumPage({super.key});

  final ContactPageController controller = Get.put(ContactPageController());
  final NostrControlller nostrControlller = Get.put(NostrControlller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Confirm recovery")),
      backgroundColor: AppTheme().theme.backgroundColor,
      body: DecoratedBox(
          decoration: const BoxDecoration(gradient: kBgGradient),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 60,
              ),
              SizedBox(
                  height: 60,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: GetX<ContactPageController>(
                                  builder: (controller) {
                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.normal),
                                          children: [
                                            TextSpan(text: "Recover with "),
                                            TextSpan(
                                                text:
                                                    "${controller.quorum.value.toString()}",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            TextSpan(text: " shares out of "),
                                            TextSpan(
                                                text:
                                                    "${controller.selectedContacts.length}",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            TextSpan(text: " total."),
                                          ]),
                                    ),
                                  ],
                                );
                              }),
                            ),
                          ],
                        ),
                      ])),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(
                  width: 60,
                  child: GradientButton(
                    onPressed: () {
                      if (controller.quorum.value < 3) {
                        return;
                      }
                      controller.quorum.value -= 1;
                    },
                    child: const Icon(Icons.remove),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 60,
                  child: GradientButton(
                    onPressed: () {
                      if (controller.quorum.value ==
                          controller.selectedContacts.length) {
                        return;
                      }
                      controller.quorum.value += 1;
                    },
                    child: const Icon(Icons.add),
                  ),
                ),
              ]),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 350,
                child: LabeledTextFormField(
                  controller: controller.dmController,
                  label: 'Personal message'.tr,
                  maxLines: 10,
                  keyboardType: TextInputType.multiline,
                  borderRadius: 10.0,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 200,
                height: 60,
                child: GradientButton(
                  onPressed: () {
                    nostrControlller.sendShares();
                  },
                  child: const Text(
                    'Send it',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
