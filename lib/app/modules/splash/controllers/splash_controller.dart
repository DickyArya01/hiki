// ignore_for_file: unnecessary_overrides

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hiki/app/data/data.dart';
import 'package:hiki/app/global/constants/images.dart';
import 'package:hiki/app/global/controller/app_controller.dart';
import 'package:hiki/app/global/theme/colors.dart';
import 'package:hiki/app/routes/app_pages.dart';

class SplashController extends GetxController {
  final AppController appController = Get.find();

  final count = 0.obs;
  Widget _firstWidget() {
    return SizedBox(
      height: Get.height * 0.25,
      child: AspectRatio(
        aspectRatio: 1,
        child: Image.asset(Images.splash),
      ),
    );
  }

  Widget _secondWidget() {
    return Text(
      "Kick the Ball - Keep your Bone",
      style: Get.textTheme.headline5!.copyWith(color: MyColors.primary),
    );
  }

  final _myWidget = Rx<Widget>(Container());
  get myWidget => _myWidget.value;
  set myWidget(val) => _myWidget.value = val;

  final SharedPreferences _data = SharedData.pref;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    myWidget = _firstWidget();
    runCode();
    super.onReady();
  }

  @override
  void onClose() {}

  changeWidget() => myWidget = _secondWidget();

  void runCode() async {
    await Future.delayed(const Duration(milliseconds: 2000), () {
      changeWidget();
    });
    await Future.delayed(const Duration(milliseconds: 2000), () {
      navigatePage();
    });
  }

  void navigatePage() async {
    String? user = _data.getString('user');
    if (user == null) {
      Get.offNamed(Routes.LANDING);
    } else {
      AppController.user = User.fromJson(json.decode(user));
      Get.offNamed(Routes.HOME);
    }
  }
}
