import 'package:flutix/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TicketEmpty extends StatelessWidget {
  const TicketEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image.asset(AppAsset.image('img_empty.png'), width: 200.w),
          // verticalSpace(Insets.med),
          Text('dontHaveTicket'.tr, style: TextStyles.text),
          verticalSpace(55.w),
        ],
      ),
    );
  }
}
