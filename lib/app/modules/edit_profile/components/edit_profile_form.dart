import 'package:flutix/app/modules/edit_profile/controllers/edit_profile_controller.dart';
import 'package:flutix/styles/colors.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/widgets/inputs/input_date.dart';
import 'package:flutix/widgets/inputs/input_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EditProfileForm extends GetView<EditProfileController> {
  const EditProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Expanded(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Insets.xl),
            child: Column(
              children: [
                InputPrimary(
                  label: 'fullNameLabel'.tr,
                  hint: 'fullNameHint'.tr,
                  controller: controller.cFullName,
                  onChanged: controller.setFullName,
                  validation: (value) => value.isNotEmpty,
                ),
                InputPrimary(
                  enable: false,
                  label: 'emailAddressLabel'.tr,
                  hint: 'emailAddressHint'.tr,
                  controller: controller.cEmail,
                ),
                InputDate(
                  label: 'dateOfBirthLabel'.tr,
                  hint: 'dateOfBirthHint'.tr,
                  initialDate: DateTime.parse(
                    controller.cUserInfo.dataUser.value.dateOfBirth,
                  ),
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
              ],
            ),
          ),
        ),
      );
    });
  }
}
