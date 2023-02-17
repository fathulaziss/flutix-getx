import 'package:flutix/app/controllers/user_info_controller.dart';
import 'package:flutix/app/modules/order/controllers/order_controller.dart';
import 'package:flutix/app/modules/order/controllers/order_seat_controller.dart';
import 'package:flutix/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:random_string/random_string.dart';

class OrderConfirmController extends GetxController {
  final cOrder = Get.find<OrderController>();
  final cOrderSeat = Get.find<OrderSeatController>();
  final cUserInfo = Get.find<UserInfoController>();

  RxString orderId = ''.obs;
  RxInt totalPrice = 0.obs;

  RxBool isLoading = false.obs;

  int fee = 1500;

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  void initData() {
    final totalFee = fee * cOrderSeat.selectedSeats.length;
    final totalTicketPrice =
        cOrder.ticketPrice.value * cOrderSeat.selectedSeats.length;

    totalPrice(totalTicketPrice + totalFee);
    orderId(randomAlphaNumeric(12).toUpperCase());
  }

  Future<void> submit() async {
    if (cUserInfo.dataUser.value.balance > totalPrice.value) {
      final pin = await Get.toNamed(Routes.PIN);
      if (pin != null) {
        // await payment();
      }
    } else {
      await Get.toNamed(Routes.TOPUP);
    }
  }
}
