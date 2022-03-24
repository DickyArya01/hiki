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

class HomeController extends GetxController {
  final AppController appController = Get.find();
  PersistentTabController tabController =
      PersistentTabController(initialIndex: 0);

  Map<String, TextEditingController> textController = {
    'search': TextEditingController(),
  };

  final SharedPreferences _data = SharedData.pref;

  String waktu = "";

  @override
  void onInit() {
    var time = DateTime.now().hour;
    if (time < 4) {
      waktu = "Malam";
    } else if (time < 10) {
      waktu = "Pagi";
    } else if (time < 15) {
      waktu = "Siang";
    } else if (time < 6) {
      waktu = "Sore";
    } else {
      waktu = "Malam";
    }
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    tabController.dispose();
  }

  Future<void> logOut() async {
    await _data.clear();
    AppController.user = null;
    Get.offAllNamed(Routes.LANDING);
  }

  List<Widget> buildScreens() {
    return [
      const BerandaTab(),
      const WalletTab(),
      const RoomTab(),
      const ChatTab(),
      const Profil()
    ];
  }

  List<PersistentBottomNavBarItem> navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.house),
        title: ("Home"),
        activeColorPrimary: MyColors.primary,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.archivebox),
        title: ("Hi-Wallet"),
        activeColorPrimary: MyColors.primary,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          CupertinoIcons.plus_circle,
          color: Colors.white,
        ),
        title: ("Pick Room"),
        activeColorPrimary: MyColors.primary,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.chat_bubble),
        title: ("Chat"),
        activeColorPrimary: MyColors.primary,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.person),
        title: ("Profil"),
        activeColorPrimary: MyColors.primary,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }
}
