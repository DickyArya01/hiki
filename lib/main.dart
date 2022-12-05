import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hiki/app/data/data.dart';
import 'package:hiki/app/global/theme/default_theme.dart';

import 'app/global/bindings/app_bindings.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHandler.init();
  await SharedData.init();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(GetMaterialApp(
    title: "Application",
    initialRoute: AppPages.initial,
    debugShowCheckedModeBanner: false,
    initialBinding: AppBinding(),
    getPages: AppPages.routes,
    theme: DefaultTheme.theme,
  ));
}


