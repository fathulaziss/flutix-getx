import 'package:flutix/app/controllers/utility_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final cUtility = Get.find<UtilityController>();
  final cDate = TextEditingController();
  final cPhoneNumber = TextEditingController();

  List<String> listDropdownExample = [
    'Dropdwon Item 1',
    'Dropdown Item 2',
    'Dropdown Item 3'
  ];
  RxString selectedDropdown = ''.obs;

  void setSelectedDropdown(String value) {
    selectedDropdown(value);
  }
}
