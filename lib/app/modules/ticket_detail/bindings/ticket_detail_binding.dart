import 'package:flutix/app/modules/ticket_detail/controllers/ticket_detail_controller.dart';
import 'package:get/get.dart';

class TicketDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TicketDetailController>(TicketDetailController.new);
  }
}
