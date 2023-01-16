import 'package:flutix/app/modules/edit_profile/components/edit_profile_photo.dart';
import 'package:flutix/app/modules/edit_profile/components/edit_profile_photo_bottomsheet.dart';
import 'package:flutix/app/modules/edit_profile/components/edit_profile_photo_update.dart';
import 'package:flutix/app/modules/edit_profile/controllers/edit_profile_controller.dart';
import 'package:flutix/styles/colors.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/widgets/others/bottomsheet_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileHeader extends GetView<EditProfileController> {
  const EditProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        width: Get.width,
        height: Get.height / 5,
        decoration: BoxDecoration(
          color: AppColor.primaryColor1,
          boxShadow: Shadows.shadowsDown,
        ),
        padding: EdgeInsets.symmetric(horizontal: Insets.xl),
        margin: EdgeInsets.only(bottom: Insets.lg),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                BottomSheetCustom(
                  context: context,
                  initialChildSize: 0.25,
                  child: const EditProfilePhotoBottomSheet(),
                ).showData();
              },
              child: controller.isPhotoEdited.value
                  ? EditProfilePhotoUpdate(
                      photoPath: controller.photoProfileEdited.value,
                    )
                  : EditProfilePhoto(data: controller.cUserInfo.dataUser.value),
            ),
            verticalSpace(Insets.lg),
          ],
        ),
      );
    });
  }
}
