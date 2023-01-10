import 'package:flutix/app/modules/home/controllers/home_controller.dart';
import 'package:flutix/app/modules/home/tab/tab_account.dart';
import 'package:flutix/app/modules/home/tab/tab_dashboard.dart';
import 'package:flutix/app/modules/home/tab/tab_explore.dart';
import 'package:flutix/app/modules/home/tab/tab_history.dart';
import 'package:flutix/app/modules/home/tab/tab_home.dart';
import 'package:flutix/widgets/others/custom_bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: CustomBottomNavBar(
          selectedIndex: controller.selectedPage.value,
          onTap: (index) {
            controller.navigation(index);
          },
        ),
        body: PageView(
          controller: controller.pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            TabHome(),
            TabExplore(),
            TabDashboard(),
            TabHistory(),
            TabAccount(),
          ],
        ),
      ),
    );
  }
}
