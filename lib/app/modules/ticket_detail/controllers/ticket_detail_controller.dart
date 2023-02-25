import 'package:flutix/app/models/ticket_model.dart';
import 'package:get/get.dart';

class TicketDetailController extends GetxController {
  Rx<TicketModel> data = const TicketModel().obs;

  @override
  void onInit() {
    final args = Get.arguments;
    if (args != null) {
      data.value = args['data'];
    }
    super.onInit();
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {}
}
