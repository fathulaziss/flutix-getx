import 'package:flutix/styles/colors.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/widgets/cards/card_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TicketDetailQr extends StatelessWidget {
  const TicketDetailQr({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'scanQr'.tr,
          style: TextStyles.title.copyWith(fontSize: 14.w),
          textAlign: TextAlign.center,
        ),
        verticalSpace(Insets.med),
        CardApp(width: 150.w, height: 150.w, color: AppColor.primaryColor1),
        verticalSpace(Insets.med),
      ],
    );
  }
}
