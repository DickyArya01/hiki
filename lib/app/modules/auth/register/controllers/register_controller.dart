import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:hiki/app/data/data.dart';
import 'package:hiki/app/global/controller/app_controller.dart';
import 'package:hiki/app/routes/app_pages.dart';

class RegisterController extends GetxController {
  ///[isHidden] adalah variabel untuk mengatur obsecure text dari field password
  final _isHidden = true.obs;
  bool get isHidden => _isHidden.value;
  set isHidden(bool val) => _isHidden.value = val;

  final Database _db = DatabaseHandler.instance;
  final SharedPreferences _data = SharedData.pref;

  Map<String, TextEditingController> textController = {
    'nama': TextEditingController(),
    'email': TextEditingController(),
    'nomer': TextEditingController(),
    'password': TextEditingController(),
    'password2': TextEditingController()
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
  void onClose() {
    textController.forEach((key, value) {
      value.dispose();
    });
  }

  void togglePasswordView() {
    isHidden = !isHidden;
  }

  Future<void> register() async {
    try {
      var value = {
        'nama': textController['nama']!.text,
        'email': textController['email']!.text,
        'nomer': "+62" + textController['nomer']!.text,
        'password': textController['password']!.text
      };
      await _db.insert("USER", value);
      var res = await _db
          .query("USER", where: "email = ?", whereArgs: [value['email']]);
      await _data.setString('user', json.encode(res.single));
      AppController.user = User.fromJson(res.single);
      Get.offAllNamed(Routes.HOME);
    } catch (e) {
      print(e);
      Get.snackbar("Oops!", "Akun sudah ada",
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
