import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutix/app/controllers/user_info_controller.dart';
import 'package:flutix/app/models/user_model.dart';
import 'package:flutix/app/modules/transaction_history/controllers/transaction_history_controller.dart';
import 'package:flutix/app/routes/app_pages.dart';
import 'package:flutix/utils/app_utils.dart';
import 'package:flutix/utils/format_currency.dart';
import 'package:flutix/widgets/others/show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopupController extends GetxController {
  final cUserInfo = Get.find<UserInfoController>();
  final cHistory = Get.find<TransactionHistoryController>();

  final cNominal = TextEditingController();
  RxInt nominal = 0.obs;
  RxBool isValidNominal = false.obs;

  RxInt selectedNominal = 0.obs;

  RxBool isLoading = false.obs;

  void setNominal(int value) {
    nominal(value);
    selectedNominal(0);
    validate();
  }

  void chooseNominal(int value) {
    AppUtils.dismissKeyboard();
    if (selectedNominal.value != value) {
      selectedNominal(value);
      cNominal.text = priceFormatWithoutSymbol(value);
      nominal(value);
      validate();
    } else {
      selectedNominal(0);
      cNominal.text = priceFormatWithoutSymbol(0);
      nominal(0);
      validate();
    }
  }

  void validate() {
    if (nominal.value >= 10000) {
      isValidNominal(true);
    } else {
      isValidNominal(false);
    }
  }

  Future<void> submit() async {
    final pin = await Get.toNamed(Routes.PIN);
    if (pin != null) {
      await topup();
    }
  }

  Future<void> topup() async {
    try {
      AppUtils.dismissKeyboard();
      isLoading(true);
      final collectionTransaction =
          FirebaseFirestore.instance.collection('transactions');

      await collectionTransaction.add({
        'transaction_type': 'Top Up',
        'title': 'Top Up E-Wallet',
        'amount': nominal.value,
        'transaction_date': DateTime.now().millisecondsSinceEpoch,
        'user_id': cUserInfo.dataUser.value.userId,
      });

      final dataUser = UserModel(
        balance: cUserInfo.dataUser.value.balance + nominal.value,
        dateOfBirth: cUserInfo.dataUser.value.dateOfBirth,
        email: cUserInfo.dataUser.value.email,
        fullName: cUserInfo.dataUser.value.fullName,
        imageProfile: cUserInfo.dataUser.value.imageProfile,
        pinTransaction: cUserInfo.dataUser.value.pinTransaction,
        userId: cUserInfo.dataUser.value.userId,
        favoriteGenres: cUserInfo.dataUser.value.favoriteGenres,
      );

      await cUserInfo.updateDataUser(data: dataUser);
      await cUserInfo.getDataUser();
      await cHistory.getTransactionHistory();

      isLoading(false);

      await Future.delayed(const Duration(milliseconds: 220));

      showPopUpInfo(
        title: 'success'.tr,
        description: '${'topup'.tr} ${'success'.tr}',
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
