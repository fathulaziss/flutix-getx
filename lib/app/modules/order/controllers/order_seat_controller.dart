import 'package:flutix/app/modules/order/controllers/order_controller.dart';
import 'package:get/get.dart';

class OrderSeatController extends GetxController {
  final cOrder = Get.find<OrderController>();

  List<int> numberofSeats = [19, 19, 19, 19, 19, 19, 19, 16];
  int minimumOrderSeat = 5;

  RxList<String> selectedSeats = <String>[].obs;
  RxBool isValidSeat = false.obs;

  void setSeats(String value) {
    if (selectedSeats.contains(value)) {
      selectedSeats.remove(value);
      validate();
    } else {
      if (selectedSeats.length < minimumOrderSeat) {
        selectedSeats.add(value);
        validate();
      }
    }
  }

  void validate() {
    if (selectedSeats.isNotEmpty) {
      isValidSeat(true);
    } else {
      isValidSeat(false);
    }
  }
}
