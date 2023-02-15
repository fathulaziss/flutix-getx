import 'package:flutix/app/modules/order/components/order_showtime_item.dart';
import 'package:flutix/app/modules/order/controllers/order_controller.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderShowtime extends GetView<OrderController> {
  const OrderShowtime({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Flex(
        direction: Axis.vertical,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Insets.xl),
            child: Text(
              'showtimes'.tr,
              style: TextStyles.text.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          verticalSpace(Insets.sm),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(bottom: Insets.med),
              itemCount: controller.listShowtime.length,
              itemBuilder: (context, index) {
                return Obx(() {
                  return OrderShowtimeItem(
                    data: controller.listShowtime[index],
                  );
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
