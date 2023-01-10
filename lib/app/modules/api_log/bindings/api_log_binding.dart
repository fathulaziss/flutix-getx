import 'package:flutix/app/modules/api_log/controllers/api_log_controller.dart';
import 'package:get/get.dart';

class ApiLogBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApiLogController>(() => ApiLogController());
  }
}
