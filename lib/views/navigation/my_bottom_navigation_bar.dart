import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../controllers/wrapper_controller.dart';
import 'navigation_dot_bar.dart';

class MyBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WrapperController>(
      init: WrapperController(),
      builder: (s) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(32.0, 0, 32.0, 32.0),
          child: BottomNavigationDotBar(
            color: kWhiteColor,
            currentIndex: s.currentPage.value,
            leftItems: [
              BottomNavigationDotBarItem(
                id: 0,
                icon: Icons.home,
                onTap: () => s.onItemTapped(0),
              ),
              BottomNavigationDotBarItem(
                id: 1,
                icon: Icons.explore,
                onTap: () => s.onItemTapped(1),
              ),
            ],
            rightItems: [
              BottomNavigationDotBarItem(
                id: 2,
                icon: Icons.swap_vert_outlined,
                onTap: () => s.onItemTapped(2),
              ),
              BottomNavigationDotBarItem(
                id: 3,
                icon: Icons.person,
                onTap: () => s.onItemTapped(3),
              ),
            ],
          ),
        );
      },
    );
  }
}
