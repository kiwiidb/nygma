import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nygma/app_theme.dart';
import 'package:nygma/views/recover_page.dart';

import '../components/buttons/gradient_button.dart';
import '../constants/colors.dart';
import 'index_or_login.dart';

class LoginChoicePage extends StatelessWidget {
  const LoginChoicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      Get.offAll(IndexOrLogin());
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
  }
}
