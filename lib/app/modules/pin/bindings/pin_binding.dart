import 'package:flutix/app/modules/pin/controllers/pin_controller.dart';
import 'package:get/get.dart';

class PinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PinController>(() => PinController());
  }
}
