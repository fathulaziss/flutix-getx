import 'package:flutix/app/modules/order/controllers/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderView extends GetView<OrderController> {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('OrderView'), centerTitle: true),
      body: const Center(
        child: Text('OrderView is working', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
