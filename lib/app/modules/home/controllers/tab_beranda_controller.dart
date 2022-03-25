// ignore_for_file: unnecessary_overrides

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hiki/app/data/data.dart';
import 'package:hiki/app/global/controller/app_controller.dart';
import 'package:hiki/app/global/theme/colors.dart';
import 'package:hiki/app/modules/home/views/tab/beranda.dart';
import 'package:hiki/app/modules/home/views/tab/wallet.dart';
import 'package:hiki/app/modules/home/views/tab/room.dart';
import 'package:hiki/app/modules/home/views/tab/profil.dart';
import 'package:hiki/app/modules/home/views/tab/chat.dart';
import 'package:hiki/app/routes/app_pages.dart';

class TabBerandaController extends GetxController {
  final AppController appController = Get.find();
  PersistentTabController tabController =
      PersistentTabController(initialIndex: 0);

  Map<String, TextEditingController> textController = {
    'search': TextEditingController(),
  };

  final SharedPreferences _data = SharedData.pref;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
