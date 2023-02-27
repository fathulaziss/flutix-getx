import 'package:flutix/app/models/app_language_model.dart';
import 'package:flutix/app/modules/onboarding/controllers/onboarding_controller.dart';
import 'package:flutix/styles/colors.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/utils/app_asset.dart';
import 'package:flutix/widgets/buttons/button_primary.dart';
import 'package:flutix/widgets/inputs/input_dropdown.dart';
import 'package:flutix/widgets/others/input_dropdwon_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Get.width,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox.square(
                  dimension: 200.w,
                  child: Image.asset(AppAsset.logo('logo_app.png')),
                ),
                Text('onboardingTitle'.tr, style: TextStyles.title),
                verticalSpace(Insets.xs),
                Text(
                  'onboardingDesc'.tr,
                  style:
                      TextStyles.text.copyWith(color: AppColor.disabledColor2),
                  textAlign: TextAlign.center,
                ),
                verticalSpace(40.w),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 55.w),
                  child: ButtonPrimary(
                    label: 'start'.tr,
                    onTap: controller.getStarted,
                  ),
                )
              ],
            ),
            Positioned(
              top: 40.w,
              right: 24.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('chooseLanguage'.tr, style: TextStyles.text),
                  verticalSpace(Insets.xs),
                  SizedBox(
                    width: 72.w,
                    child: InputDropdown(
                      hintText: '',
                      borderColor: AppColor.backgroundColor2,
                      outlinedBorderColor: Colors.transparent,
                      textAlign: TextAlign.center,
                      items: [
                        ...controller.cUtility.appLanguageOptions.map((item) {
                          return DropdownMenuItem<AppLanguageModel>(
                            value: item,
                            child: InputDropdownItem(value: item.language),
                          );
                        })
                      ],
                      selectedItem:
                          controller.cUtility.appLanguage.value.language,
                      onChanged: (value) {
                        if (value != null) {
                          final data = value as AppLanguageModel;
                          controller.cUtility.changeLanguage(data);
                        }
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
