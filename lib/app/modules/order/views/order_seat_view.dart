import 'package:flutix/app/modules/order/components/order_seat.dart';
import 'package:flutix/app/modules/order/components/order_seat_button.dart';
import 'package:flutix/app/modules/order/components/order_seat_indicator_item.dart';
import 'package:flutix/app/modules/order/controllers/order_seat_controller.dart';
import 'package:flutix/styles/colors.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/utils/app_asset.dart';
import 'package:flutix/widgets/pages/page_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderSeatView extends GetView<OrderSeatController> {
  const OrderSeatView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageDefault(
      title: 'ticketOrder'.tr,
      backgroundColor: AppColor.backgroundColor1,
      bottomBarHeight: 115.w,
      bottomBar: const OrderSeatButton(),
      child: Flex(
        direction: Axis.vertical,
        children: [
          Padding(
            padding: EdgeInsets.all(Insets.xl),
            child: Image.asset(
              AppAsset.image('img_screen_cinema.png'),
              width: Get.width,
            ),
          ),
          const OrderSeat(),
          verticalSpace(Insets.lg),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OrderSeatIndicatorItem(label: 'available'.tr),
              OrderSeatIndicatorItem(
                label: 'booked'.tr,
                color: AppColor.disabledColor2,
              ),
              OrderSeatIndicatorItem(
                label: 'selected'.tr,
                color: AppColor.primaryColor1,
                outlineColor: AppColor.primaryColor1,
              ),
            ],
          ),
          verticalSpace(Insets.lg),
        ],
      ),
    );
  }
}
