import 'package:flutix/app/modules/transaction_history/controllers/transaction_history_controller.dart';
import 'package:flutix/styles/colors.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/utils/format_currency.dart';
import 'package:flutix/widgets/cards/card_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TransactionHistoryWallet extends GetView<TransactionHistoryController> {
  const TransactionHistoryWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CardApp(
        padding: EdgeInsets.zero,
        color: AppColor.primaryColor1,
        radius: 20.w,
        isShowShadows: true,
        shadows: [
          BoxShadow(
            color: AppColor.primaryColor1.withOpacity(.5),
            blurRadius: 5,
            offset: const Offset(0, 5),
          ),
        ],
        child: Stack(
          children: [
            Positioned(
              bottom: -25.w,
              left: -20.w,
              child: Container(
                width: 100.w,
                height: 100.w,
                margin: EdgeInsets.only(right: 4.w),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.08),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.w),
              child: Flex(
                direction: Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 18.w,
                        height: 18.w,
                        margin: EdgeInsets.only(right: 4.w),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.yellowColor2,
                        ),
                      ),
                      Container(
                        width: 30.w,
                        height: 30.w,
                        margin: EdgeInsets.only(right: 4.w),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.yellowColor1,
                        ),
                      )
                    ],
                  ),
                  verticalSpace(Insets.lg),
                  Text(
                    'balance'.tr,
                    style: TextStyles.desc.copyWith(color: Colors.white),
                  ),
                  Text(
                    priceFormat(controller.cUserInfo.dataUser.value.balance),
                    style: TextStyles.title.copyWith(color: Colors.white),
                  ),
                  verticalSpace(Insets.lg),
                  Row(
                    children: [
                      Expanded(
                        flex: 6,
                        child: Text(
                          'cardHolder'.tr,
                          style: TextStyles.desc.copyWith(color: Colors.white),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'cardId'.tr,
                          textAlign: TextAlign.left,
                          style: TextStyles.desc.copyWith(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                  verticalSpace(Insets.xs),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 6,
                        child: (controller
                                .cUserInfo.dataUser.value.fullName.isEmpty)
                            ? const SizedBox()
                            : (controller.cUserInfo.dataUser.value.fullName
                                        .length <=
                                    25)
                                ? Row(
                                    children: [
                                      Text(
                                        controller
                                            .cUserInfo.dataUser.value.fullName
                                            .toUpperCase(),
                                        textAlign: TextAlign.left,
                                        style: TextStyles.title.copyWith(
                                          fontSize: 12.w,
                                          color: Colors.white,
                                        ),
                                      ),
                                      horizontalSpace(Insets.lg),
                                      Container(
                                        width: 16.w,
                                        height: 16.w,
                                        margin: EdgeInsets.only(right: 16.w),
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColor.greenColor,
                                        ),
                                        child: Icon(
                                          Icons.check,
                                          color: Colors.white,
                                          size: 12.w,
                                        ),
                                      ),
                                    ],
                                  )
                                : Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          controller
                                              .cUserInfo.dataUser.value.fullName
                                              .toUpperCase(),
                                          textAlign: TextAlign.left,
                                          style: TextStyles.title.copyWith(
                                            fontSize: 12.w,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      horizontalSpace(Insets.lg),
                                      Container(
                                        width: 16.w,
                                        height: 16.w,
                                        margin: EdgeInsets.only(right: 16.w),
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColor.greenColor,
                                        ),
                                        child: Icon(
                                          Icons.check,
                                          color: Colors.white,
                                          size: 12.w,
                                        ),
                                      ),
                                    ],
                                  ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'FLUTIX',
                                textAlign: TextAlign.left,
                                style: TextStyles.title.copyWith(
                                  fontSize: 12.w,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              width: 16.w,
                              height: 16.w,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColor.greenColor,
                              ),
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 12.w,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
