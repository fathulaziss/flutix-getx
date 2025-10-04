import 'package:flutix/app/modules/order/controllers/order_seat_controller.dart';
import 'package:flutix/styles/colors.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/utils/format_currency.dart';
import 'package:flutix/widgets/buttons/button_primary.dart';
import 'package:flutix/widgets/cards/card_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderSeatButton extends GetView<OrderSeatController> {
  const OrderSeatButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return CardApp(
        padding:
            EdgeInsets.symmetric(horizontal: Insets.xl, vertical: Insets.sm),
        isShowShadows: true,
        shadows: Shadows.shadowsUp,
        color: AppColor.backgroundColor1,
        radius: 0,
        child: Column(
          children: [
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
                ),
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
                ),
              ],
            ),
            verticalSpace(Insets.sm),
            ButtonPrimary(
              onTap: controller.onSubmit,
              label: 'continuee'.tr,
              enabled: controller.isValidSeat.value,
            ),
          ],
        ),
      );
    });
  }
}
