import 'package:flutix/app/controllers/user_info_controller.dart';
import 'package:flutix/app/data/genre_data.dart';
import 'package:flutix/app/models/genre_model.dart';
import 'package:flutix/utils/app_utils.dart';
import 'package:flutix/utils/regex.dart';
import 'package:flutix/widgets/others/show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

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
      listGenre(RxList.from(data.map((e) => GenreModel.fromJson(e))));
    } catch (e) {
      logSys(e.toString());
    }
  }

  Future<void> changePhotoProfile(ImageSource source) async {
    final picker = ImagePicker();
    final file = await picker.pickImage(source: source);
    photoProfile(file != null ? file.path : '');
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

  Future<void> signUp() async {
    try {
      isLoading(true);
      await Future.delayed(const Duration(seconds: 2));
      isLoading(false);

      // final firebaseAuth = FirebaseAuth.instance;
      // final collectionReference =
      //     FirebaseFirestore.instance.collection('users');

      // final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
      //   email: email.value,
      //   password: password.value,
      // );

      // final dataUser = UserModel(
      //   userId: userCredential.user!.uid,
      //   email: email.value,
      //   fullName: fullName.value,
      //   pinTransaction: pinTransaction.value,
      //   dateOfBirth: dateOfBirth.value,
      //   balance: 1000000,
      // );

      // await collectionReference.doc(dataUser.userId).set(dataUser.toJson());

      // cUserInfo.setDataUser(dataUser);

      // await Future.delayed(const Duration(seconds: 1));

      // isLoading(false);

      // await Get.offAllNamed(Routes.REGISTER_SUCCESS);
    } catch (e) {
      isLoading(false);
      showPopUpInfo(title: 'Error', description: e.toString());
      logSys(e.toString());
    }
  }
}
