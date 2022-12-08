
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiki/app/data/models/futsal.dart';
import 'package:hiki/app/modules/detail/controller/detail_controller.dart';

class DetailView extends GetView<DetailController> {

  DetailView({Key? key}) : super(key: key);

  Futsal data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:  AppBar(
        title: const Text("Detail"),
        centerTitle: true,
      ),
      body: Center(
        child: Text(data.title),
      ),
    );
  }

}