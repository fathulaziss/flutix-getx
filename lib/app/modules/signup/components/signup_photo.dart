import 'dart:io';

import 'package:flutix/app/modules/signup/components/signup_photo_bottomsheet.dart';
import 'package:flutix/app/modules/signup/controllers/signup_controller.dart';
import 'package:flutix/utils/app_asset.dart';
import 'package:flutix/widgets/others/bottomsheet_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignupPhoto extends GetView<SignupController> {
  const SignupPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SizedBox(
        width: 80.w,
        height: 90.w,
        child: Stack(
          children: [
            if (controller.photoProfile.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(80.w),
                child: Image.file(
                  File(controller.photoProfile.value),
                  width: 80.w,
                  height: 80.w,
                  fit: BoxFit.cover,
                ),
              )
            else
              Image.asset(
                AppAsset.image('img_photo_profile.png'),
                width: 80.w,
              ),
            Align(
              alignment: Alignment.bottomCenter,
              child: IconButton(
                onPressed: () {
                  if (controller.photoProfile.isEmpty) {
                    BottomSheetCustom(
                      context: context,
                      initialChildSize: 0.25,
                      child: const SignupPhotoBottomSheet(),
                    ).showData();
                  } else {
                    controller.removePhotoProfile();
                  }
                },
                padding: EdgeInsets.zero,
                highlightColor: Colors.transparent,
                constraints: BoxConstraints(minWidth: 24.w),
                icon: Image.asset(
                  controller.photoProfile.isEmpty
                      ? AppAsset.icon('ic_add_photo.png')
                      : AppAsset.icon('ic_remove_photo.png'),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
