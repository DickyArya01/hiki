import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Obx(() {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: controller.myWidget,
        );
      })),
    );
  }
}
