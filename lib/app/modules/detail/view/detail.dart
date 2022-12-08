
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiki/app/modules/detail/controller/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  const DetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:  AppBar(
        title: const Text("Detail"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("Detail Page"),
      ),
    );
  }

}