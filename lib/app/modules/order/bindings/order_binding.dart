import 'package:flutix/app/modules/order/controllers/order_confirm_controller.dart';
import 'package:flutix/app/modules/order/controllers/order_controller.dart';
import 'package:flutix/app/modules/order/controllers/order_seat_controller.dart';
import 'package:get/get.dart';

class OrderBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut<OrderController>(OrderController.new)
      ..lazyPut<OrderSeatController>(OrderSeatController.new)
      ..lazyPut<OrderConfirmController>(OrderConfirmController.new);
  }
}
