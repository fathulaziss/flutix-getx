import 'package:flutix/app/modules/order/components/order_seat_item.dart';
import 'package:flutix/app/modules/order/controllers/order_seat_controller.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderSeat extends GetView<OrderSeatController> {
  const OrderSeat({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Insets.xl),
            child: generateSeat(),
          ),
        ),
      ),
    );
  }

  Column generateSeat() {
    final listSeatTemp = <Widget>[];
    for (var i = controller.numberofSeats.length - 1; i >= 0; i--) {
      listSeatTemp.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(controller.numberofSeats[i], (index) {
            return OrderSeatItem(
              data: '${String.fromCharCode(i + 65)}${index + 1}',
              isEnable: index != 0,
              margin: EdgeInsets.only(
                right: index < controller.numberofSeats[i] - 1 ? 12.w : 0,
                bottom: 12.w,
              ),
            );
          }),
        ),
      );
    }
    return Column(children: listSeatTemp);
  }
}
