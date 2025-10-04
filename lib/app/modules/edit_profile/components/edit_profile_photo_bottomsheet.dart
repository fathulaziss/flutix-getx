import 'package:flutix/app/modules/edit_profile/controllers/edit_profile_controller.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/utils/app_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfilePhotoBottomSheet extends GetView<EditProfileController> {
  const EditProfilePhotoBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'editPhoto'.tr,
          style: TextStyles.title.copyWith(fontSize: 12.w),
        ),
        verticalSpace(Insets.med),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 88.w,
              child: Column(
                children: [
                  IconButton(
                    onPressed: () {
                      controller.changePhotoProfile(ImageSource.camera);
                      Get.back();
                    },
                    padding: EdgeInsets.zero,
                    icon: SizedBox.square(
                      dimension: 55.w,
                      child: Image.asset(
                        AppAsset.icon('ic_camera2.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  verticalSpace(Insets.sm),
                  Text('camera'.tr, style: TextStyles.desc),
                ],
              ),
            ),
            SizedBox(
              width: 88.w,
              child: Column(
                children: [
                  IconButton(
                    onPressed: () {
                      controller.changePhotoProfile(ImageSource.gallery);
                      Get.back();
                    },
                    padding: EdgeInsets.zero,
                    icon: SizedBox.square(
                      dimension: 55.w,
                      child: Image.asset(
                        AppAsset.icon('ic_gallery.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  verticalSpace(Insets.sm),
                  Text('gallery'.tr, style: TextStyles.desc),
                ],
              ),
            ),
            SizedBox(
              width: 88.w,
              child: Column(
                children: [
                  IconButton(
                    onPressed: () {
                      controller.removePhotoProfile();
                    },
                    padding: EdgeInsets.zero,
                    icon: SizedBox.square(
                      dimension: 55.w,
                      child: Image.asset(
                        AppAsset.icon('ic_remove.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  verticalSpace(Insets.sm),
                  Text('removePhoto'.tr, style: TextStyles.desc),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
