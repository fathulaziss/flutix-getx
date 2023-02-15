import 'package:flutix/app/modules/order/components/order_date_item.dart';
import 'package:flutix/app/modules/order/controllers/order_controller.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderDate extends GetView<OrderController> {
  const OrderDate({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Insets.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Insets.xl),
            child: Text(
              'chooseDate'.tr,
              style: TextStyles.text.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          verticalSpace(Insets.sm),
          SizedBox(
            width: Get.width,
            height: 50.w,
            child: ListView.builder(
              itemCount: controller.listDate.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Obx(() {
                  return OrderDateItem(
                    isSelected: controller.selectedDate.value ==
                        controller.listDate[index],
                    data: controller.listDate[index],
                    margin: EdgeInsets.only(
                      left: index == 0 ? Insets.xl : Insets.med,
                      right: index == controller.listDate.length - 1
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
