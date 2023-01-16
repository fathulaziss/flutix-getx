import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutix/app/controllers/user_info_controller.dart';
import 'package:flutix/app/models/user_model.dart';
import 'package:flutix/utils/app_utils.dart';
import 'package:flutix/utils/format_date_time.dart';
import 'package:flutix/widgets/others/show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';

class EditProfileController extends GetxController {
  final cUserInfo = Get.find<UserInfoController>();

  RxString photoProfileEdited = ''.obs;
  RxBool isPhotoEdited = false.obs;

  final cFullName = TextEditingController();
  RxString fullName = ''.obs;
  bool isValidFullName = false;

  final cEmail = TextEditingController();

  final cDateOfBirth = TextEditingController();
  RxString dateOfBirth = ''.obs;
  bool isValidDateOfBirth = false;

  RxBool isValidForm = false.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  void initData() {
    cFullName.text = cUserInfo.dataUser.value.fullName;
    cEmail.text = cUserInfo.dataUser.value.email;
    cDateOfBirth.text = FormatDateTime.format(
      value: DateTime.parse(cUserInfo.dataUser.value.dateOfBirth),
      format: DateFormat('dd-MM-yyyy'),
    );
    setFullName(cUserInfo.dataUser.value.fullName);
    setDateOfBirth(DateTime.parse(cUserInfo.dataUser.value.dateOfBirth));
  }

  void setFullName(String value) {
    fullName(value);
    validateForm();
  }

  void setDateOfBirth(DateTime value) {
    dateOfBirth(value.toString());
    validateForm();
  }

  void validateForm() {
    if (fullName.value != cUserInfo.dataUser.value.fullName ||
        dateOfBirth.value != cUserInfo.dataUser.value.dateOfBirth ||
        isPhotoEdited.value) {
      isValidForm(true);
    } else {
      isValidForm(false);
    }
  }

  Future<void> changePhotoProfile(ImageSource source) async {
    final picker = ImagePicker();
    final file = await picker.pickImage(source: source);
    if (file != null) {
      photoProfileEdited(file.path);
      isPhotoEdited(true);
      validateForm();
    }
  }

  void removePhotoProfile() {
    photoProfileEdited('');
    isPhotoEdited(true);
    validateForm();
    Get.back();
  }

  Future<String> uploadPhoto() async {
    final fileName = basename(photoProfileEdited.value);

    final ref = FirebaseStorage.instance.ref().child(fileName);
    final task = ref.putFile(File(photoProfileEdited.value));
    final snapshot = await task;
    final url = await snapshot.ref.getDownloadURL();

    return url;
  }

  Future<void> submit() async {
    try {
      AppUtils.dismissKeyboard();

      isLoading(true);

      var url = '';

      if (isPhotoEdited.value && photoProfileEdited.value.isNotEmpty) {
        url = await uploadPhoto();
      }

      final dataUser = UserModel(
        balance: cUserInfo.dataUser.value.balance,
        dateOfBirth: dateOfBirth.value,
        email: cUserInfo.dataUser.value.email,
        fullName: fullName.value,
        imageProfile:
            isPhotoEdited.value ? url : cUserInfo.dataUser.value.imageProfile,
        pinTransaction: cUserInfo.dataUser.value.pinTransaction,
        userId: cUserInfo.dataUser.value.userId,
        favoriteGenres: cUserInfo.dataUser.value.favoriteGenres,
      );

      await cUserInfo.updateDataUser(data: dataUser);
      await cUserInfo.getDataUser();

      await Future.delayed(const Duration(seconds: 1));

      isLoading(false);

      await Future.delayed(const Duration(milliseconds: 300));

      showPopUpInfo(
        title: 'success'.tr,
        description: 'updateProfileSuccess'.tr,
        onPress: () {
          Get
            ..back()
            ..back();
        },
      );
    } catch (e) {
      isLoading(false);
      logSys(e.toString());
    }
  }
}
