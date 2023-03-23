import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nygma/app_theme.dart';

import '../components/buttons/gradient_button.dart';
import '../components/labeled_text_form_field.dart';
import '../constants/colors.dart';
import '../controllers/recover_page_controller.dart';

class RecoverPage extends StatelessWidget {
  RecoverPage({super.key});

  final RecoverPageController controller = Get.put(RecoverPageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recover')),
      backgroundColor: AppTheme().theme.backgroundColor,
      body: DecoratedBox(
        decoration: const BoxDecoration(gradient: kBgGradient),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: GetX<RecoverPageController>(builder: (controller) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                      height: 60,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Number of shares"),
                                Text(
                                  controller.shardControllerList.length
                                      .toString(),
                                  style: const TextStyle(fontSize: 30),
                                )
                              ],
                            ),
                            Row(children: [
                              SizedBox(
                                width: 50,
                                child: GradientButton(
                                  onPressed: () {
                                    controller.addShare();
                                  },
                                  child: const Icon(Icons.add),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                width: 50,
                                child: GradientButton(
                                  onPressed: () {
                                    controller.removeShare();
                                  },
                                  child: const Icon(Icons.remove),
                                ),
                              )
                            ])
                          ])),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    height: 500,
                    child: ListView.separated(
                      itemBuilder: (context, i) {
                        return LabeledTextFormField(
                            label: "Share ${i + 1}",
                            controller: controller.shardControllerList[i]);
                      },
                      itemCount: controller.shardControllerList.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 12,
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: GradientButton(
                      onPressed: () {
                        //todo
                      },
                      child: const Text(
                        'Recover',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            })),
      ),
    );
  }
}
