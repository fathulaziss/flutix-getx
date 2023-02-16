import 'package:flutix/app/modules/order/controllers/order_seat_controller.dart';
import 'package:flutix/app/routes/app_pages.dart';
import 'package:flutix/styles/colors.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/utils/format_currency.dart';
import 'package:flutix/widgets/buttons/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderSeatButton extends GetView<OrderSeatController> {
  const OrderSeatButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        decoration: BoxDecoration(
          boxShadow: Shadows.shadowsUp,
          color: AppColor.backgroundColor1,
        ),
        child: Column(
          children: [
            verticalSpace(Insets.sm),
            Row(
              children: [
                Text(
                  'yourSeat'.tr,
                  style: TextStyles.desc.copyWith(fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: Text(
                    controller.selectedSeats.join(', '),
                    style:
                        TextStyles.desc.copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.end,
                  ),
                )
              ],
            ),
            verticalSpace(Insets.xs),
            Row(
              children: [
                Text(
                  'totalPrice'.tr,
                  style: TextStyles.desc.copyWith(fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: Text(
                    priceFormat(
                      controller.selectedSeats.length *
                          controller.cOrder.ticketPrice.value,
                    ),
                    style:
                        TextStyles.desc.copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.end,
                  ),
                )
              ],
            ),
            verticalSpace(Insets.sm),
            ButtonPrimary(
              onTap: () => Get.toNamed(Routes.ORDER),
              label: 'continuee'.tr,
              margin: EdgeInsets.symmetric(horizontal: 24.w),
              enabled: controller.isValidSeat.value,
            ),
          ],
        ),
      );
    });
  }
}
