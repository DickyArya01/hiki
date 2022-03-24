import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/lupapassword_controller.dart';

class LupapasswordView extends GetView<LupapasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LupapasswordView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'LupapasswordView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
