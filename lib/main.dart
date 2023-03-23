import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nygma/app_theme.dart';
import 'package:nygma/views/auth/login.dart';
import 'package:nygma/views/index_page.dart';

import 'views/index_or_login.dart';
import 'views/login_choice.dart';

void main() async {
  await GetStorage.init('contacts');
  await GetStorage.init('identity');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme().theme,
      home: LoginChoicePage(),
    );
  }
}
