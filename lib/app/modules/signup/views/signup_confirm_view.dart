import 'dart:io';

import 'package:flutix/app/modules/signup/controllers/signup_controller.dart';
import 'package:flutix/styles/colors.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/utils/app_asset.dart';
import 'package:flutix/utils/regex.dart';
import 'package:flutix/widgets/buttons/button_primary.dart';
import 'package:flutix/widgets/pages/page_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignupConfirmView extends GetView<SignupController> {
  const SignupConfirmView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return PageDefault(
        title: 'signUpTitle'.tr,
        backgroundColor: AppColor.backgroundColor1,
        bottomBarHeight: 90.w,
        bottomBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: ButtonPrimary(
            onTap: controller.signUp,
            label: 'signUp'.tr,
            margin: EdgeInsets.symmetric(horizontal: 24.w),
            isLoading: controller.isLoading.value,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(24.w),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'signUpConfirmTitle'.tr,
                  style: TextStyles.title,
                  textAlign: TextAlign.center,
                ),
                verticalSpace(24.w),
                if (controller.photoProfile.isNotEmpty)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(80.w),
                    child: Image.file(
                      File(controller.photoProfile.value),
                      width: 120.w,
                      height: 120.w,
                      fit: BoxFit.cover,
                    ),
                  )
                else
                  Image.asset(
                    AppAsset.image('img_photo_profile.png'),
                    width: 120.w,
                  ),
                verticalSpace(24.w),
                Text(
                  convertTitleCase(controller.fullName.value),
                  style:
                      TextStyles.title.copyWith(fontWeight: FontWeight.normal),
                ),
                Text(controller.email.value, style: TextStyles.text),
              ],
            ),
          ),
        ),
      );
    });
  }
}
