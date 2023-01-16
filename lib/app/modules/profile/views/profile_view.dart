import 'package:flutix/app/modules/profile/components/profile_header.dart';
import 'package:flutix/app/modules/profile/components/profile_language_bottomsheet.dart';
import 'package:flutix/app/modules/profile/components/profile_menu.dart';
import 'package:flutix/app/modules/profile/controllers/profile_controller.dart';
import 'package:flutix/app/routes/app_pages.dart';
import 'package:flutix/services/app_cycle_service.dart';
import 'package:flutix/widgets/others/bottomsheet_custom.dart';
import 'package:flutix/widgets/others/show_dialog.dart';
import 'package:flutix/widgets/pages/page_default.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return PageDefault(
        title: 'profile'.tr,
        shadowColor: Colors.transparent,
        child: Column(
          children: [
            ProfileHeader(data: controller.cUserInfo.dataUser.value),
            ProfileMenu(
              icon: Icons.person_rounded,
              label: 'editProfile'.tr,
              onTap: () => Get.toNamed(Routes.EDIT_PROFILE),
            ),
            ProfileMenu(
              icon: Icons.lock_open,
              label: 'changePassword'.tr,
              onTap: () {
                showPopUpInfo(
                  title: 'information'.tr,
                  description: 'underDevelopment'.tr,
                );
              },
            ),
            ProfileMenu(
              icon: Icons.pin,
              label: 'changePin'.tr,
              onTap: () {
                showPopUpInfo(
                  title: 'information'.tr,
                  description: 'underDevelopment'.tr,
                );
              },
            ),
            ProfileMenu(
              icon: Icons.translate,
              label: 'changeLanguage'.tr,
              onTap: () {
                BottomSheetCustom(
                  context: context,
                  initialChildSize: 0.31,
                  child: const ProfileLanguageBottomSheet(),
                ).showData();
              },
            ),
            ProfileMenu(
              icon: Icons.power_settings_new,
              label: 'signOut'.tr,
              onTap: () {
                showPopUpConfirmation(
                  title: 'confirmation'.tr,
                  description: 'exitApp'.tr,
                  onPressPositive: () => AppCycleService().onUserLogout(),
                  labelButtonPostive: 'yes'.tr.toUpperCase(),
                  labelButtonNegative: 'cancel'.tr.toUpperCase(),
                );
              },
            ),
          ],
        ),
      );
    });
  }
}
