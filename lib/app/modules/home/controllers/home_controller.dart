import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final pageController = PageController();
  RxInt selectedPage = 0.obs;

  void navigation(int index) {
    selectedPage(index);
    pageController.jumpToPage(index);
  }
}
