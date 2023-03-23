import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:nygma/controllers/auth_controller.dart';
import 'package:nygma/views/auth/login.dart';
import 'package:nygma/views/index_page.dart';

class IndexOrLogin extends StatelessWidget {
  IndexOrLogin({super.key});
  final AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return GetX<AuthController>(builder: (controller) {
      if (controller.pubkey.value == "") {
        return LoginPage();
      }
      return const IndexPage();
    });
  }
}
