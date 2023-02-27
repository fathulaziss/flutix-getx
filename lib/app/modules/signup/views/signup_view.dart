import 'package:flutix/app/modules/signup/components/signup_photo.dart';
import 'package:flutix/app/modules/signup/controllers/signup_controller.dart';
import 'package:flutix/styles/colors.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/widgets/buttons/button_primary.dart';
import 'package:flutix/widgets/inputs/input_date.dart';
import 'package:flutix/widgets/inputs/input_email.dart';
import 'package:flutix/widgets/inputs/input_password.dart';
import 'package:flutix/widgets/inputs/input_primary.dart';
import 'package:flutix/widgets/pages/page_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return PageDefault(
        title: 'signUpTitle'.tr,
        backgroundColor: AppColor.backgroundColor1,
        isScrollable: true,
        bottomBarHeight: 70.w,
        bottomBar: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          decoration: BoxDecoration(
            boxShadow: Shadows.shadowsUp,
            color: AppColor.backgroundColor1,
          ),
          child: ButtonPrimary(
            onTap: () => controller.goToFormtwo(),
            label: 'continuee'.tr,
            margin: EdgeInsets.symmetric(horizontal: 24.w),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(24.w),
          child: Column(
            children: [
              const SignupPhoto(),
              InputPrimary(
                label: 'fullNameLabel'.tr,
                hint: 'fullNameHint'.tr,
                controller: controller.cFullName,
                onChanged: controller.setFullName,
                validation: (value) => value.isNotEmpty,
              ),
              InputEmail(
                label: 'emailAddressLabel'.tr,
                hint: 'emailAddressHint'.tr,
                controller: controller.cEmail,
                value: controller.setEmail,
                validationText: 'emailAddressValidationText2'.tr,
              ),
              InputDate(
                label: 'dateOfBirthLabel'.tr,
                hint: 'dateOfBirthHint'.tr,
                initialDate: DateTime.now(),
                firstDate: DateTime(1945),
                suffixIcon: Padding(
                  padding: EdgeInsets.only(right: Insets.sm),
                  child: Icon(
                    Icons.calendar_month,
                    size: 24.w,
                    color: AppColor.primaryColor1,
                  ),
                ),
                controller: controller.cDateOfBirth,
                value: controller.setDateOfBirth,
              ),
              InputPassword(
                label: 'passwordLabel'.tr,
                hint: 'passwordHint'.tr,
                controller: controller.cPassword,
                value: controller.setPassword,
                validationText: 'passwordValidationText2'.tr,
              ),
              InputPassword(
                label: 'pinTransactionLabel'.tr,
                hint: 'pinTransactionHint'.tr,
                controller: controller.cPinTransaction,
                value: controller.setPinTransaction,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(6),
                ],
                validation: (value) {
                  if (value.length != 6) {
                    return false;
                  } else {
                    return true;
                  }
                },
                validationText: 'pinTransactionValidationText'.tr,
              ),
            ],
          ),
        ),
      );
    });
  }
}
