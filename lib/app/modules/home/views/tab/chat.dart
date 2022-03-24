import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiki/app/global/constants/images.dart';
import 'package:hiki/app/modules/home/controllers/home_controller.dart';

class ChatTab extends GetView<HomeController> {
  const ChatTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chat")),
      body: SingleChildScrollView(
        child: Image.asset(
          Images.chat,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
