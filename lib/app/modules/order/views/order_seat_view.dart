import 'package:flutix/app/modules/order/components/order_seat_indicator_item.dart';
import 'package:flutix/app/modules/order/controllers/order_seat_controller.dart';
import 'package:flutix/app/routes/app_pages.dart';
import 'package:flutix/styles/colors.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/utils/app_asset.dart';
import 'package:flutix/widgets/buttons/button_primary.dart';
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
      bottomBarHeight: 70.w,
      bottomBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        decoration: BoxDecoration(
          boxShadow: Shadows.shadowsUp,
          color: AppColor.backgroundColor1,
        ),
        child: ButtonPrimary(
          onTap: () => Get.toNamed(Routes.ORDER),
          label: 'continuee'.tr,
          margin: EdgeInsets.symmetric(horizontal: 24.w),
          // enabled: controller.isValidSchedule.value,
        ),
      ),
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
          Obx(
            () => Expanded(
              child: SingleChildScrollView(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: Insets.xl),
                    child: Column(children: controller.listSeat),
                  ),
                ),
              ),
            ),
          ),
          verticalSpace(Insets.lg),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              OrderSeatIndicatorItem(label: 'Available'),
              OrderSeatIndicatorItem(
                label: 'Booked',
                color: AppColor.disabledColor2,
              ),
              OrderSeatIndicatorItem(
                label: 'Selected',
                color: AppColor.primaryColor1,
                outlineColor: AppColor.primaryColor1,
              ),
            ],
          ),
          verticalSpace(Insets.lg)
        ],
      ),
    );
  }
}
