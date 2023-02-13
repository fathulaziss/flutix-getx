import 'package:flutix/app/modules/signup/controllers/signup_controller.dart';
import 'package:flutix/app/routes/app_pages.dart';
import 'package:flutix/styles/colors.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/widgets/buttons/button_primary.dart';
import 'package:flutix/widgets/cards/card_app.dart';
import 'package:flutix/widgets/pages/page_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignupTwoView extends GetView<SignupController> {
  const SignupTwoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return PageDefault(
        title: 'signUpTitle'.tr,
        backgroundColor: AppColor.backgroundColor1,
        isScrollable: true,
        bottomBarHeight: 90.w,
        bottomBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: ButtonPrimary(
            onTap: () => Get.toNamed(Routes.SIGNUP_CONFIRM),
            label: 'continuee'.tr,
            margin: EdgeInsets.symmetric(horizontal: 24.w),
            isLoading: controller.isLoading.value,
            enabled: controller.isValidFormTwo.value,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'signUpTwoTitle'.tr,
                style: TextStyles.text.copyWith(fontWeight: FontWeight.bold),
              ),
              verticalSpace(24.w),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3,
                  mainAxisSpacing: 16.w,
                  crossAxisSpacing: 24.w,
                ),
                itemCount: controller.listGenre.length,
                itemBuilder: (context, index) {
                  return Obx(() {
                    return InkWell(
                      onTap: () {
                        controller.selectGenre(controller.listGenre[index]);
                      },
                      child: CardApp(
                        color: controller.selectedGenre
                                .contains(controller.listGenre[index])
                            ? AppColor.yellowColor1
                            : Colors.white,
                        outlineColor: controller.selectedGenre
                                .contains(controller.listGenre[index])
                            ? AppColor.yellowColor1
                            : AppColor.disabledColor2,
                        isOutlined: true,
                        child: Center(
                          child: Text(
                            controller.listGenre[index].name,
                            style: TextStyles.text,
                          ),
                        ),
                      ),
                    );
                  });
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
