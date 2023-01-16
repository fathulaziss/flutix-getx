import 'package:flutix/app/modules/profile/components/profile_language_item.dart';
import 'package:flutix/app/modules/profile/controllers/profile_controller.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileLanguageBottomSheet extends GetView<ProfileController> {
  const ProfileLanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'chooseLanguage'.tr,
            style: TextStyles.title.copyWith(fontSize: 14.w),
          ),
          verticalSpace(Insets.xs),
          verticalSpace(Insets.med),
          ...controller.cUtility.appLanguageOptions.map((item) {
            return ProfileLanguageItem(
              label: item.language == 'ID'
                  ? 'Bahasa (Indonesia)'
                  : 'English (United States)',
              isSelected: item.language ==
                  controller.cUtility.appLanguage.value.language,
              onTap: () {
                controller.cUtility.changeLanguage(item);
                Get.back();
              },
            );
          }).toList(),
        ],
      );
    });
  }
}
