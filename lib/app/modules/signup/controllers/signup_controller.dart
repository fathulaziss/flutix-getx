import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutix/app/controllers/user_info_controller.dart';
import 'package:flutix/app/data/genre_data.dart';
import 'package:flutix/app/models/genre_model.dart';
import 'package:flutix/app/models/user_model.dart';
import 'package:flutix/app/routes/app_pages.dart';
import 'package:flutix/utils/app_utils.dart';
import 'package:flutix/utils/regex.dart';
import 'package:flutix/widgets/others/show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:permission_handler/permission_handler.dart';

class SignupController extends GetxController {
  final cUserInfo = Get.find<UserInfoController>();

  RxString photoProfile = ''.obs;

  final cFullName = TextEditingController();
  RxString fullName = ''.obs;
  bool isValidFullName = false;

  final cEmail = TextEditingController();
  RxString email = ''.obs;
  bool isValidEmail = false;

  final cDateOfBirth = TextEditingController();
  RxString dateOfBirth = ''.obs;
  bool isValidDateOfBirth = false;

  final cPassword = TextEditingController();
  RxString password = ''.obs;
  bool isValidPasswordd = false;

  final cPinTransaction = TextEditingController();
  RxString pinTransaction = ''.obs;
  bool isValidPinTransaction = false;

  RxList<GenreModel> listGenre = <GenreModel>[].obs;
  RxList<GenreModel> selectedGenre = <GenreModel>[].obs;

  RxBool isValidFormOne = false.obs;
  RxBool isValidFormTwo = false.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    getGenre();
    super.onInit();
  }

  Future<void> getGenre() async {
    try {
      final data = genreData;
      listGenre(RxList.from(data.map(GenreModel.fromJson)));
    } catch (e) {
      logSys(e.toString());
    }
  }

  Future<void> checkPermission(ImageSource source) async {
    final isCameraGranted = await Permission.camera.isGranted;
    if (isCameraGranted) {
      await changePhotoProfile(source);
    } else {
      showPopUpInfo(
        title: 'requestPermission'.tr,
        description: 'requestPermissionCamera'.tr,
        onPress: () async {
          Get.back();
          await requestCameraPermission(source);
        },
      );
    }
  }

  Future<void> requestCameraPermission(ImageSource source) async {
    final cameraStatus = await Permission.camera.request();
    if (cameraStatus.isGranted) {
      if (cameraStatus.isGranted) {
        await changePhotoProfile(source);
      }
    } else if (cameraStatus.isPermanentlyDenied || cameraStatus.isRestricted) {
      showPopUpInfo(
        title: 'information'.tr,
        description: 'requestPermissionCameraDenyPermanent'.tr,
        labelButton: 'OK',
        onPress: () async {
          Get.back();
          await openAppSettings();
        },
      );
    } else {
      showToast(message: 'requestPermissionCameraDeny'.tr);
    }
  }

  Future<void> changePhotoProfile(ImageSource source) async {
    final picker = ImagePicker();
    final file = await picker.pickImage(source: source);
    if (file != null) {
      photoProfile(file.path);
    }
  }

  void removePhotoProfile() {
    photoProfile('');
  }

  void setFullName(String value) {
    fullName(value);
    if (fullName.value.isNotEmpty) {
      isValidFullName = true;
    } else {
      isValidFullName = false;
    }
    validateFormOne();
  }

  void setEmail(String value) {
    email(value);
    if (GetUtils.isEmail(email.value)) {
      isValidEmail = true;
    } else {
      isValidEmail = false;
    }
    validateFormOne();
  }

  void setDateOfBirth(DateTime value) {
    dateOfBirth(value.toString());
    if (dateOfBirth.value.isNotEmpty) {
      isValidDateOfBirth = true;
    } else {
      isValidDateOfBirth = false;
    }
    validateFormOne();
  }

  void setPassword(String value) {
    password(value);
    if (isValidPassword(password: password.value)) {
      isValidPasswordd = true;
    } else {
      isValidPasswordd = false;
    }
    validateFormOne();
  }

  void setPinTransaction(String value) {
    pinTransaction(value);
    if (pinTransaction.value.length == 6) {
      isValidPinTransaction = true;
    } else {
      isValidPinTransaction = false;
    }
    validateFormOne();
  }

  void validateFormOne() {
    if (isValidFullName &&
        isValidEmail &&
        isValidDateOfBirth &&
        isValidPasswordd &&
        isValidPinTransaction) {
      isValidFormOne(true);
    } else {
      isValidFormOne(false);
    }
  }

  Future<void> goToFormtwo() async {
    selectedGenre.clear();
    validateFormTwo();
    await Get.toNamed(Routes.SIGNUP_TWO);
  }

  void selectGenre(GenreModel value) {
    if (!selectedGenre.contains(value)) {
      if (selectedGenre.length < 4) {
        selectedGenre.add(value);
      }
    } else {
      selectedGenre.remove(value);
    }
    validateFormTwo();
  }

  void validateFormTwo() {
    if (selectedGenre.length == 4) {
      isValidFormTwo(true);
    } else {
      isValidFormTwo(false);
    }
  }

  Future<String> uploadPhoto() async {
    final fileName = basename(photoProfile.value);

    final ref = FirebaseStorage.instance.ref().child(fileName);
    final task = ref.putFile(File(photoProfile.value));
    final snapshot = await task;
    final url = await snapshot.ref.getDownloadURL();

    return url;
  }

  Future<void> signUp() async {
    try {
      isLoading(true);

      final firebaseAuth = FirebaseAuth.instance;
      final collectionReference =
          FirebaseFirestore.instance.collection('users');

      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email.value,
        password: password.value,
      );

      var photoProfilePath = '';

      if (photoProfile.value.isNotEmpty) {
        photoProfilePath = await uploadPhoto();
      }

      final dataUser = UserModel(
        userId: userCredential.user!.uid,
        email: email.value,
        fullName: fullName.value,
        pinTransaction: pinTransaction.value,
        dateOfBirth: dateOfBirth.value,
        imageProfile: photoProfilePath,
        favoriteGenres: selectedGenre.map((item) => item.id).toList(),
      );

      await collectionReference.doc(dataUser.userId).set(dataUser.toJson());

      cUserInfo.setDataUser(dataUser);

      await Future.delayed(const Duration(seconds: 1));

      isLoading(false);

      await Future.delayed(const Duration(milliseconds: 250));

      await Get.offAllNamed(Routes.HOME);
    } catch (e) {
      isLoading(false);
      showPopUpInfo(
        title: 'Error',
        description: e
            .toString()
            .replaceAll('[firebase_auth/email-already-in-use] ', ''),
      );
      logSys(e.toString());
    }
  }
}
