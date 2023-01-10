import 'package:flutix/app/modules/onboarding/models/onboarding_model.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/utils/app_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingSlidetile extends StatelessWidget {
  const OnboardingSlidetile({Key? key, required this.data}) : super(key: key);

  final OnboardingModel data;

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        SizedBox(
          width: double.infinity,
          height: 280.w,
          child: Image.asset(AppAsset.image(data.image)),
        ),
        verticalSpace(40.w),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                data.title,
                style: TextStyles.title.copyWith(fontSize: 16.w),
                textAlign: TextAlign.center,
              ),
              verticalSpace(25.w),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Text(
                  data.desc,
                  style: TextStyles.desc,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
