import 'package:flutix/app/modules/order/components/order_date.dart';
import 'package:flutix/app/modules/order/components/order_showtime.dart';
import 'package:flutix/app/modules/order/controllers/order_controller.dart';
import 'package:flutix/styles/colors.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/widgets/buttons/button_primary.dart';
import 'package:flutix/widgets/pages/page_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderView extends GetView<OrderController> {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return PageDefault(
        title: 'ticketOrder'.tr,
        backgroundColor: AppColor.backgroundColor1,
        bottomBarHeight: 70.w,
        bottomBar: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          decoration: BoxDecoration(
            boxShadow: Shadows.shadowsUp,
            color: AppColor.backgroundColor1,
          ),
          child: ButtonPrimary(
            onTap: controller.onSubmit,
            label: 'continuee'.tr,
            margin: EdgeInsets.symmetric(horizontal: 24.w),
            enabled: controller.isValidSchedule.value,
          ),
        ),
        child: const Flex(
          direction: Axis.vertical,
          children: [
            OrderDate(),
            OrderShowtime(),
          ],
        ),
      );
    });
  }
}
