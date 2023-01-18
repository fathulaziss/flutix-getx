import 'package:flutix/app/modules/home/controllers/home_controller.dart';
import 'package:flutix/app/modules/home/tab/tab_movie.dart';
import 'package:flutix/app/modules/home/tab/tab_ticket.dart';
import 'package:flutix/app/routes/app_pages.dart';
import 'package:flutix/styles/colors.dart';
import 'package:flutix/utils/app_asset.dart';
import 'package:flutix/widgets/others/custom_bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        extendBody: true,
        backgroundColor: AppColor.backgroundColor1,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.toNamed(Routes.TOPUP),
          child: Image.asset(
            AppAsset.icon('ic_topup.png'),
            width: 30.w,
            color: Colors.white,
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          color: Colors.white,
          elevation: 10,
          notchMargin: 10,
          child: CustomBottomNavBar(
            selectedIndex: controller.selectedPage.value,
            onTap: (index) {
              controller.navigation(index);
            },
          ),
        ),
        body: PageView(
          controller: controller.pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            TabMovie(),
            TabTicket(),
          ],
        ),
      ),
    );
  }
}
