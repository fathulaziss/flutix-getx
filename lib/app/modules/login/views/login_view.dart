import 'package:flutix/app/models/app_language_model.dart';
import 'package:flutix/app/modules/login/controllers/login_controller.dart';
import 'package:flutix/app/routes/app_pages.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/widgets/buttons/button_primary.dart';
import 'package:flutix/widgets/inputs/input_date.dart';
import 'package:flutix/widgets/inputs/input_dropdown.dart';
import 'package:flutix/widgets/inputs/input_email.dart';
import 'package:flutix/widgets/inputs/input_number.dart';
import 'package:flutix/widgets/inputs/input_password.dart';
import 'package:flutix/widgets/inputs/input_phone.dart';
import 'package:flutix/widgets/inputs/input_primary.dart';
import 'package:flutix/widgets/others/input_dropdwon_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        bottomNavigationBar: Container(
          decoration:
              BoxDecoration(boxShadow: Shadows.shadowsUp, color: Colors.white),
          height: 90.w,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: ButtonPrimary(
              label: 'login'.tr,
              onTap: () => Get.toNamed(Routes.HOME),
            ),
          ),
        ),
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      verticalSpace(Insets.xl),
                      InputPrimary(
                        label: 'Input Primary',
                        onChanged: (value) {},
                      ),
                      InputEmail(
                        label: 'Input Email',
                        value: (value) {},
                      ),
                      InputPassword(
                        label: 'Input Password',
                        value: (value) {},
                      ),
                      InputNumber(
                        label: 'Input Number',
                        value: (value) {},
                      ),
                      InputPhone(
                        label: 'Input Phone',
                        controller: controller.cPhoneNumber,
                        value: (value) {},
                      ),
                      InputDropdown(
                        title: 'Input Dropdown',
                        hintText: 'Choose Item',
                        items: [
                          ...controller.listDropdownExample.map((item) {
                            return DropdownMenuItem<String>(
                              value: item,
                              child: InputDropdownItem(value: item),
                            );
                          })
                        ],
                        selectedItem: controller.selectedDropdown.value,
                        onChanged: (value) {
                          if (value != null) {
                            final data = value as String;
                            controller.setSelectedDropdown(data);
                          }
                        },
                      ),
                      InputDate(
                        label: 'Input Date',
                        controller: controller.cDate,
                        value: (value) {},
                      ),
                      verticalSpace(
                        MediaQuery.of(context).viewInsets.bottom / 8,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 20.w,
                right: 20.w,
                child: SizedBox(
                  width: 72.w,
                  height: 50.w,
                  child: InputDropdown(
                    hintText: '',
                    borderColor: Colors.blueGrey[100],
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
              )
            ],
          ),
        ),
      );
    });
  }
}
