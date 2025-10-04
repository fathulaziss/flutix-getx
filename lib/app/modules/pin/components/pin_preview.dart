import 'package:flutix/styles/colors.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/utils/app_asset.dart';
import 'package:flutix/widgets/buttons/button_primary.dart';
import 'package:flutix/widgets/others/show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PinPreview extends StatelessWidget {
  const PinPreview({super.key, required this.pin});

  final String pin;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.height / 2.65,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppAsset.image('img_pin.png'),
            color: AppColor.primaryColor1,
            width: 75.w,
          ),
          verticalSpace(Insets.xl),
          Text(
            'enterYourPin'.tr,
            style: TextStyles.title.copyWith(fontSize: 18.w),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: Insets.lg),
            child: SizedBox(
              width: 200.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (pin.isEmpty)
                    Icon(
                      Icons.circle_outlined,
                      color: AppColor.primaryColor1,
                      size: 20.w,
                    )
                  else
                    Icon(
                      Icons.circle,
                      color: AppColor.primaryColor1,
                      size: 20.w,
                    ),
                  if (pin.length > 1)
                    Icon(
                      Icons.circle,
                      color: AppColor.primaryColor1,
                      size: 20.w,
                    )
                  else
                    Icon(
                      Icons.circle_outlined,
                      color: AppColor.primaryColor1,
                      size: 20.w,
                    ),
                  if (pin.length > 2)
                    Icon(
                      Icons.circle,
                      color: AppColor.primaryColor1,
                      size: 20.w,
                    )
                  else
                    Icon(
                      Icons.circle_outlined,
                      color: AppColor.primaryColor1,
                      size: 20.w,
                    ),
                  if (pin.length > 3)
                    Icon(
                      Icons.circle,
                      color: AppColor.primaryColor1,
                      size: 20.w,
                    )
                  else
                    Icon(
                      Icons.circle_outlined,
                      color: AppColor.primaryColor1,
                      size: 20.w,
                    ),
                  if (pin.length > 4)
                    Icon(
                      Icons.circle,
                      color: AppColor.primaryColor1,
                      size: 20.w,
                    )
                  else
                    Icon(
                      Icons.circle_outlined,
                      color: AppColor.primaryColor1,
                      size: 20.w,
                    ),
                  if (pin.length > 5)
                    Icon(
                      Icons.circle,
                      color: AppColor.primaryColor1,
                      size: 20.w,
                    )
                  else
                    Icon(
                      Icons.circle_outlined,
                      color: AppColor.primaryColor1,
                      size: 20.w,
                    ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width / 2.7),
            child: ButtonPrimary(
              onTap: () {
                showPopUpInfo(
                  title: 'information'.tr,
                  description: 'underDevelopment'.tr,
                );
              },
              label: 'forgotPin'.tr,
              height: 30.w,
              radius: 8.w,
              textStyle: TextStyles.title
                  .copyWith(fontSize: 14.w, color: AppColor.primaryColor1),
              isOutline: true,
              color: Colors.white,
              outlineColor: AppColor.primaryColor1,
            ),
          ),
        ],
      ),
    );
  }
}
