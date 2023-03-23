import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nygma/app_theme.dart';
import 'package:nygma/controllers/contact_page_controller.dart';

import '../components/buttons/gradient_button.dart';
import '../components/labeled_text_form_field.dart';
import '../constants/colors.dart';
import '../controllers/recover_page_controller.dart';

class QuorumPage extends StatelessWidget {
  QuorumPage({super.key});

  final ContactPageController controller = Get.put(ContactPageController());
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
                height: 100,
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
                              child: Expanded(
                                child: GetX<ContactPageController>(
                                    builder: (controller) {
                                  return Text(
                                    "Recover with ${controller.quorum.value.toString()} shares out of ${controller.selectedContacts.length} total.",
                                    style: const TextStyle(fontSize: 20),
                                  );
                                }),
                              ),
                            )
                          ],
                        ),
                      ])),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                const SizedBox(
                  width: 10,
                ),
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
                )
              ]),
              const SizedBox(
                height: 60,
              ),
              SizedBox(
                width: 200,
                height: 60,
                child: GradientButton(
                  onPressed: () {
                    controller.sendShares();
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
