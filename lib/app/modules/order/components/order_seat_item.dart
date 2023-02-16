import 'package:flutix/app/modules/order/controllers/order_seat_controller.dart';
import 'package:flutix/styles/colors.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/widgets/cards/card_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderSeatItem extends GetView<OrderSeatController> {
  const OrderSeatItem({
    super.key,
    required this.data,
    required this.margin,
    required this.isEnable,
  });

  final String data;
  final EdgeInsets margin;
  final bool isEnable;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return InkWell(
        onTap: () {
          controller.setSeats(data);
        },
        child: CardApp(
          width: 30.w,
          height: 30.w,
          constraints: BoxConstraints(minHeight: 30.w, minWidth: 30.w),
          color: controller.selectedSeats.contains(data)
              ? AppColor.primaryColor1
              : isEnable
                  ? AppColor.backgroundColor1
                  : AppColor.disabledColor2,
          outlineColor: controller.selectedSeats.contains(data)
              ? AppColor.primaryColor1
              : AppColor.disabledColor2,
          isOutlined: true,
          padding: EdgeInsets.zero,
          margin: margin,
          radius: 6.w,
          child: Center(
            child: Text(
              data,
              style: TextStyles.desc.copyWith(
                fontSize: 10.w,
                color: controller.selectedSeats.contains(data)
                    ? Colors.white
                    : isEnable
                        ? Colors.black
                        : AppColor.backgroundColor2,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
    });
  }
}
