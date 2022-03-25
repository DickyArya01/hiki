import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiki/app/global/constants/images.dart';
import 'package:hiki/app/modules/home/controllers/home_controller.dart';

class WalletTab extends GetView<HomeController> {
  const WalletTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Image.asset(
            Images.wallet,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
