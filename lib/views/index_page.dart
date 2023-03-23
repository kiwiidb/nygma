import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nygma/views/contact_overview.dart';

import '../constants/colors.dart';
import '../controllers/wrapper_controller.dart';
import 'navigation/my_bottom_navigation_bar.dart';
import 'profile_settings_view.dart';

class IndexPage extends StatelessWidget {
  final WrapperController wrapperController = Get.put(WrapperController());
  IndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: const BoxDecoration(gradient: kBgGradient),
        child: Scaffold(
          extendBody: true,
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
          ])),
          body: PageView.builder(
            onPageChanged: (page) {
              wrapperController.onItemTapped(page);
            },
            controller: wrapperController.pageController,
            itemCount: 2,
            itemBuilder: (BuildContext context, int index) {
              return [
                ContactOverView(),
                ProfileSettingsView(),
              ][index];
            },
          ),
          resizeToAvoidBottomInset: false,
          //bottomNavigationBar: MyBottomNavigationBar(),
        ));
  }
}
