import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  PageController pageController = PageController();
  RxInt selectedPage = 0.obs;

  @override
  void onInit() {
    final args = Get.arguments;
    if (args != null) {
      final pageIndex = args['index'];
      pageController = PageController(initialPage: pageIndex);
      selectedPage(pageIndex);
      // switch (pageIndex) {
      //   case 1:
      //     cTicket.getTicket();
      //     break;
      // }
    }
    super.onInit();
  }

  void navigation(int index) {
    selectedPage(index);
    pageController.jumpToPage(index);
  }
}
