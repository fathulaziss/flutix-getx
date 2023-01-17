import 'package:flutix/styles/colors.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TransactionHistoryEmpty extends StatelessWidget {
  const TransactionHistoryEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image.asset(AppAsset.image('img_empty.png'), width: 200.w),
          // verticalSpace(Insets.med),
          Text(
            'dontHaveTransaction'.tr,
            style: TextStyles.text.copyWith(color: AppColor.disabledColor2),
          ),
          verticalSpace(55.w),
        ],
      ),
    );
  }
}
