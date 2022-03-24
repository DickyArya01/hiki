import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:hiki/app/data/data.dart';
import 'package:hiki/app/global/controller/app_controller.dart';
import 'package:hiki/app/routes/app_pages.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  final _isHidden = true.obs;
  bool get isHidden => _isHidden.value;
  set isHidden(bool val) => _isHidden.value = val;

  final _isEmail = true.obs;
  bool get isEmail => _isEmail.value;
  set isEmail(bool val) => _isEmail.value = val;

  final Database _db = DatabaseHandler.instance;
  final SharedPreferences _data = SharedData.pref;

  Map<String, TextEditingController> textController = {
    'akun': TextEditingController(),
    'password': TextEditingController()
  };

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
  void togglePasswordView() {
    isHidden = !isHidden;
  }

  void toggleEmailorTelepon() {
    isEmail = !isEmail;
    textController['akun']!.clear();
  }

  Future<void> login() async {
    try {
      var value = {
        'akun': textController['akun']!.text,
        'password': textController['password']!.text,
      };
      var res = await _db.query("USER",
          where: "(email = ? OR nomer = ?) AND password = ?",
          whereArgs: [value['akun'], value['akun'], value['password']]);
      if (res.isNotEmpty) {
        _data.setString('user', json.encode(res.last));
        AppController.user = User.fromJson(res.last);
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.snackbar("Oops!",
            "${isEmail ? 'Email' : 'Nomor Telepon'} dan password tidak sesuai}",
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar("Oops!",
          "${isEmail ? 'Email' : 'Nomor Telepon'} dan password tidak sesuai}",
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
