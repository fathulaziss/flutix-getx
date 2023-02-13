import 'package:flutix/app/modules/order/components/order_date_item.dart';
import 'package:flutix/app/modules/order/controllers/order_controller.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderCinema extends GetView<OrderController> {
  const OrderCinema({super.key});

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
              'chooseCinema'.tr,
              style: TextStyles.text.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          verticalSpace(Insets.sm),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: controller.listDate.length,
              itemBuilder: (context, index) {
                return Obx(() {
                  return OrderDateItem(
                    isSelected: controller.selectedDate.value ==
                        controller.listDate[index],
                    data: controller.listDate[index],
                    margin: EdgeInsets.only(
                      left: Insets.xl,
                      top: index == 0 ? 0 : Insets.med,
                      bottom: index == controller.listDate.length - 1
                          ? Insets.xl
                          : 0,
                    ),
                    onTap: () => controller.setDate(controller.listDate[index]),
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
