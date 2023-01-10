// ignore_for_file: directives_ordering

import 'package:get/get.dart';
import 'package:flutix/app/modules/home/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
