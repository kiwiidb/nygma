import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nygma/app_theme.dart';
import 'package:nygma/views/auth/login.dart';
import 'package:nygma/views/index_page.dart';
import 'package:nygma/views/recover_page.dart';

import '../components/buttons/gradient_button.dart';
import '../constants/colors.dart';
import '../controllers/auth_controller.dart';
import 'index_or_login.dart';

class LoginChoicePage extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  LoginChoicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<AuthController>(builder: (controller) {
      if (controller.pubkey.value != "") {
        return IndexPage();
      }
      return Scaffold(
        appBar: AppBar(
            title: Row(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.asset(
                  'images/icon.png',
                  height: 50,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                "Nygma",
                style: TextStyle(fontSize: 20),
              )
            ]),
            actions: []),
        body: DecoratedBox(
          decoration: const BoxDecoration(gradient: kBgGradient),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: GradientButton(
                      onPressed: () {
                        Get.to(LoginPage());
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: GradientButton(
                      onPressed: () {
                        Get.to(RecoverPage());
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
              ),
            ),
          ),
        ),
      );
    });
  }
}
