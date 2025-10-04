import 'package:flutix/app/models/user_model.dart';
import 'package:flutix/styles/colors.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/utils/app_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfilePhoto extends StatelessWidget {
  const EditProfilePhoto({super.key, required this.data});

  final UserModel data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80.w,
      height: 80.w,
      child: Stack(
        alignment: Alignment.bottomRight,
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
                    borderRadius: BorderRadius.circular(80.w),
                    child: Image.network(data.imageProfile, fit: BoxFit.cover),
                  )
                : Image.asset(AppAsset.image('img_photo_profile.png')),
          ),
          Container(
            width: 24.w,
            height: 24.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Image.asset(
              AppAsset.icon('ic_camera.png'),
              color: Colors.blueGrey[200],
            ),
          ),
        ],
      ),
    );
  }
}
