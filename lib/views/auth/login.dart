import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/buttons/gradient_button.dart';
import '../../components/labeled_text_form_field.dart';
import '../../constants/colors.dart';
import '../../controllers/auth_controller.dart';

class LoginPage extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());

  LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(gradient: kBgGradient),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login', style: TextStyle(fontSize: 20.0)),
        ),
        body: GetX<AuthController>(builder: (controller) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 36),
              child: Form(
                child: CustomScrollView(
                  slivers: [
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Column(
                        children: <Widget>[
                          const SizedBox(height: 40.0),
                          LabeledTextFormField(
                            label: "Nostr private key:",
                            controller: authController.privkeyController,
                            hintText: "nsec123456",
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const Spacer(),
                          const SizedBox(height: 50.0),
                          GradientButton(
                            onPressed: () {
                              authController.loginNsec(
                                  authController.privkeyController.text);
                            },
                            text: "continue".tr,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Visibility(
                            visible: authController.isLoading.value,
                            child: Column(
                              children: [
                                const CircularProgressIndicator(),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20.0),
                                  child: Center(
                                      child: Text(
                                    "please-click-link".tr,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 12),
                                  )),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
