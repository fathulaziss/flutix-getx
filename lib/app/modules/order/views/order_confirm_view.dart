import 'package:flutix/app/modules/order/components/order_confirm_button.dart';
import 'package:flutix/app/modules/order/components/order_confirm_detail.dart';
import 'package:flutix/app/modules/order/components/order_confirm_header.dart';
import 'package:flutix/app/modules/order/controllers/order_confirm_controller.dart';
import 'package:flutix/styles/colors.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/widgets/pages/page_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderConfirmView extends GetView<OrderConfirmController> {
  const OrderConfirmView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageDefault(
      title: 'ticketConfirm'.tr,
      backgroundColor: AppColor.backgroundColor1,
      bottomBarHeight: 130.w,
      bottomBar: const OrderConfirmButton(),
      child: Padding(
        padding: EdgeInsets.all(Insets.xl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            OrderConfirmHeader(),
            OrderConfirmDetail(),
          ],
        ),
      ),
    );
  }
}
