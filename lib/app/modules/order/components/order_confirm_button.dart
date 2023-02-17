import 'package:flutix/app/modules/order/controllers/order_confirm_controller.dart';
import 'package:flutix/styles/colors.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/utils/format_currency.dart';
import 'package:flutix/widgets/buttons/button_primary.dart';
import 'package:flutix/widgets/cards/card_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderConfirmButton extends GetView<OrderConfirmController> {
  const OrderConfirmButton({super.key});

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'paymentMethod'.tr,
                  style: TextStyles.desc.copyWith(fontWeight: FontWeight.bold),
                ),
                CardApp(
                  width: 18.w,
                  constraints: BoxConstraints(minHeight: 18.w),
                  padding: EdgeInsets.zero,
                  color: AppColor.disabledColor2,
                  radius: 50.w,
                  child: Icon(
                    Icons.more_horiz,
                    color: Colors.white,
                    size: 18.w,
                  ),
                )
              ],
            ),
            verticalSpace(Insets.xs),
            Row(
              children: [
                CardApp(
                  width: 100.w,
                  constraints: BoxConstraints(minHeight: 20.w),
                  padding: EdgeInsets.all(Insets.sm),
                  margin: EdgeInsets.only(right: Insets.med),
                  radius: 8.w,
                  color: AppColor.primaryColor1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.account_balance_wallet_outlined,
                        color: Colors.white,
                        size: 18.w,
                      ),
                      horizontalSpace(Insets.sm),
                      Text(
                        'FlutixPay',
                        style: TextStyles.title
                            .copyWith(fontSize: 12.w, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'balance'.tr,
                        style: TextStyles.desc
                            .copyWith(color: AppColor.disabledColor2),
                      ),
                      Text(
                        priceFormat(
                          controller.cUserInfo.dataUser.value.balance,
                        ),
                        style: TextStyles.title.copyWith(
                          color: AppColor.primaryColor1,
                          fontSize: 12.w,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                )
              ],
            ),
            verticalSpace(Insets.sm),
            ButtonPrimary(
              onTap: controller.submit,
              label: controller.cUserInfo.dataUser.value.balance >
                      controller.totalPrice.value
                  ? 'payNow'.tr
                  : 'topup'.tr,
              isLoading: controller.isLoading.value,
            ),
          ],
        ),
      );
    });
  }
}
