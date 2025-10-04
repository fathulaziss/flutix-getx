import 'package:flutix/app/models/app_language_model.dart';
import 'package:flutix/app/modules/signin/controllers/signin_controller.dart';
import 'package:flutix/app/routes/app_pages.dart';
import 'package:flutix/styles/colors.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/utils/app_asset.dart';
import 'package:flutix/widgets/buttons/button_primary.dart';
import 'package:flutix/widgets/buttons/button_text_rich.dart';
import 'package:flutix/widgets/inputs/input_dropdown.dart';
import 'package:flutix/widgets/inputs/input_email.dart';
import 'package:flutix/widgets/inputs/input_password.dart';
import 'package:flutix/widgets/others/input_dropdwon_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SigninView extends GetView<SigninController> {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(MediaQuery.of(context).size.height / 6.5),
                    SizedBox.square(
                      dimension: 100.w,
                      child: Image.asset(AppAsset.logo('logo_app.png')),
                    ),
                    verticalSpace(Insets.xl),
                    Text('signInTitle'.tr, style: TextStyles.title),
                    verticalSpace(Insets.xl),
                    InputEmail(
                      label: 'emailAddressLabel'.tr,
                      hint: 'emailAddressHint'.tr,
                      controller: controller.cEmail,
                      value: controller.setEmail,
                      validation: (value) => value.isNotEmpty,
                      validationText: 'emailAddressValidationText'.tr,
                    ),
                    InputPassword(
                      label: 'passwordLabel'.tr,
                      hint: 'passwordHint'.tr,
                      controller: controller.cPassword,
                      value: controller.setPassword,
                      validation: (value) => value.isNotEmpty,
                      validationText: 'passwordValidationText'.tr,
                    ),
                    verticalSpace(Insets.xs),
                    Row(
                      children: [
                        IconButton(
                          onPressed: controller.setRememberMe,
                          padding: EdgeInsets.zero,
                          constraints:
                              BoxConstraints(minWidth: 24.w, minHeight: 24.w),
                          highlightColor: Colors.transparent,
                          icon: controller.isRememberMe.value
                              ? const Icon(Icons.check_box)
                              : const Icon(Icons.check_box_outline_blank),
                        ),
                        horizontalSpace(Insets.xs),
                        Text('rememberMe'.tr, style: TextStyles.text),
                      ],
                    ),
                    verticalSpace(30.w),
                    ButtonPrimary(
                      label: 'signIn'.tr,
                      onTap: controller.signIn,
                      isLoading: controller.isLoading.value,
                      enabled: controller.isValidForm.value,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ButtonTextRich(
                        label1: 'dontHaveAccount'.tr,
                        label2: 'signUp'.tr,
                        onPressed: () => Get.toNamed(Routes.SIGNUP),
                      ),
                    ),
                    verticalSpace(
                      MediaQuery.of(context).viewInsets.bottom / 10,
                    ),
                  ],
                ),
              ),
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
                        }),
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
            ),
          ],
        ),
      );
    });
  }
}
