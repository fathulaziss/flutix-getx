import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutix/app/controllers/utility_controller.dart';
import 'package:flutix/app/routes/app_pages.dart';
import 'package:flutix/constants/constant.dart';
import 'package:flutix/utils/app_storage.dart';
import 'package:flutix/utils/app_utils.dart';
import 'package:flutix/widgets/others/show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninController extends GetxController {
  final cUtility = Get.find<UtilityController>();

  final cEmail = TextEditingController();
  RxString email = ''.obs;
  bool isValidEmail = false;

  final cPassword = TextEditingController();
  RxString password = ''.obs;
  bool isValidPassword = false;

  RxBool isValidForm = false.obs;
  RxBool isLoading = false.obs;
  RxBool isRememberMe = false.obs;

  @override
  void onInit() {
    getDataLogin();
    super.onInit();
  }

  Future<void> getDataLogin() async {
    final username = await AppStorage.read(key: CACHE_ACCESS_USERNAME);
    final password = await AppStorage.read(key: CACHE_ACCESS_PASSWORD);
    if (username.isNotEmpty && password.isNotEmpty) {
      cEmail.text = username;
      cPassword.text = password;
      setEmail(username);
      setPassword(password);
      isRememberMe(true);
    }
  }

  void setEmail(String value) {
    email(value);
    if (email.value.isNotEmpty) {
      isValidEmail = true;
      if (value == OPEN_LOG) {
        cUtility.showLogButton();
      }
      if (value == CLOSE_LOG) {
        cUtility.hideLogButton();
      }
    } else {
      isValidEmail = false;
    }
    validateForm();
  }

  void setPassword(String value) {
    password(value);
    if (password.value.isNotEmpty) {
      isValidPassword = true;
    } else {
      isValidPassword = false;
    }
    validateForm();
  }

  void setRememberMe() {
    isRememberMe(!isRememberMe.value);
    AppUtils.dismissKeyboard();
  }

  void validateForm() {
    if (isValidEmail && isValidPassword) {
      isValidForm(true);
    } else {
      isValidForm(false);
    }
  }

  Future<void> signIn() async {
    try {
      AppUtils.dismissKeyboard();
      isLoading(true);

      final firebaseAuth = FirebaseAuth.instance;

      await firebaseAuth.signInWithEmailAndPassword(
        email: email.value,
        password: password.value,
      );

      await Future.delayed(const Duration(seconds: 1));

      isLoading(false);

      await Future.delayed(const Duration(milliseconds: 250));

      if (isRememberMe.value) {
        await AppStorage.write(key: CACHE_ACCESS_USERNAME, value: email.value);
        await AppStorage.write(
          key: CACHE_ACCESS_PASSWORD,
          value: password.value,
        );
      }

      await Get.offNamed(Routes.HOME);
    } catch (e) {
      isLoading(false);
      showPopUpInfo(
        title: 'Error',
        description:
            e.toString().replaceAll('[firebase_auth/wrong-password] ', ''),
      );
      logSys(e.toString());
    }
  }
}
