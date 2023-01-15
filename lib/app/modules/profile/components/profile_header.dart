import 'package:flutix/app/models/user_model.dart';
import 'package:flutix/styles/colors.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/utils/app_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key, required this.data});

  final UserModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        color: AppColor.primaryColor1,
        boxShadow: Shadows.shadowsDown,
      ),
      padding: EdgeInsets.symmetric(horizontal: Insets.xl),
      margin: EdgeInsets.only(bottom: Insets.lg),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80.w,
            height: 80.w,
            padding: EdgeInsets.all(Insets.xs),
            decoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(color: AppColor.primaryColor4),
            ),
            child: data.imageProfile.isNotEmpty
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(88.w),
                    child: Image.network(
                      data.imageProfile,
                      fit: BoxFit.cover,
                    ),
                  )
                : Image.asset(AppAsset.image('img_photo_profile.png')),
          ),
          verticalSpace(Insets.lg),
          Text(
            data.fullName,
            style:
                TextStyles.title.copyWith(color: Colors.white, fontSize: 14.w),
          ),
          Text(
            data.email,
            style: TextStyles.desc.copyWith(color: Colors.white),
          ),
          verticalSpace(Insets.xl),
        ],
      ),
    );
  }
}
