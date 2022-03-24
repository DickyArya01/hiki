import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiki/app/modules/home/controllers/home_controller.dart';

class RoomTab extends GetView<HomeController> {
  const RoomTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create Room")),
      body: SingleChildScrollView(
        child: Column(),
      ),
    );
  }
}
