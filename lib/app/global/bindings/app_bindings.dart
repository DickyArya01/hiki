import 'package:get/get.dart';
import 'package:hiki/app/global/controller/app_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AppController>(
      AppController(),
    );
  }
}
