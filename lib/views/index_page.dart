import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nygma/views/contact_overview.dart';

import '../constants/colors.dart';
import '../controllers/wrapper_controller.dart';
import 'navigation/my_bottom_navigation_bar.dart';
import 'profile_settings_view.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(gradient: kBgGradient),
      child: GetX<WrapperController>(
        init: WrapperController(),
        builder: (s) => Scaffold(
          extendBody: true,
          appBar: AppBar(
            title: TextButton(
              child: Text(
                s.currentDisplayString.value,
                style: const TextStyle(fontSize: 20),
              ),
              onPressed: () => {s.switchDisplay()},
            ),
            actions: [],
          ),
          body: PageView.builder(
            onPageChanged: (page) {
              s.onItemTapped(page);
            },
            controller: s.pageController,
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
        ),
      ),
    );
  }
}
