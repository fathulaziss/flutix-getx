import 'package:flutix/app/routes/app_pages.dart';
import 'package:flutix/styles/colors.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/utils/app_asset.dart';
import 'package:flutix/widgets/buttons/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderSuccessView extends StatelessWidget {
  const OrderSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppAsset.image('img_ticket_success.png'), width: 180.w),
            Text(
              'ticketOrderSuccessTitle'.tr,
              style: TextStyles.title.copyWith(fontSize: 20.w),
            ),
            verticalSpace(Insets.med),
            Text(
              'ticketOrderSuccessDesc'.tr,
              style: TextStyles.text
                  .copyWith(fontSize: 16.w, color: AppColor.disabledColor2),
              textAlign: TextAlign.center,
            ),
            verticalSpace(Insets.xxl),
            ButtonPrimary(
              width: Get.width / 1.5,
              label: 'checkTicket'.tr,
              onTap: () =>
                  Get.offAllNamed(Routes.HOME, arguments: {'index': 1}),
            ),
          ],
        ),
      ),
    );
  }
}
