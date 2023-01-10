import 'dart:convert';
import 'dart:ui';

import 'package:flutix/app/data/app_language_data.dart';
import 'package:flutix/app/models/app_language_model.dart';
import 'package:flutix/constants/constant.dart';
import 'package:flutix/utils/app_storage.dart';
import 'package:flutix/utils/app_utils.dart';
import 'package:get/get.dart';

class UtilityController extends GetxController {
  String appVersion = 'version 1.0.0';
  RxBool isShowLog = false.obs;
  RxString currentPage = ''.obs;
  Rx<AppLanguageModel> appLanguage = AppLanguageModel().obs;
  RxList<AppLanguageModel> appLanguageOptions = <AppLanguageModel>[].obs;

  @override
  void onInit() {
    initData();
    getAppVersion();
    getAppLanguageOptions();
    super.onInit();
  }

  Future<void> initData() async {
    final b = await AppStorage.isContain(key: 'log-button');
    isShowLog(b);
  }

  Future<void> getAppVersion() async {
    appVersion = await AppUtils.getAppVersion();
  }

  Future<void> showLogButton() async {
    await AppStorage.write(key: LOG_BUTTON, value: '1');
    isShowLog(true);
  }

  Future<void> hideLogButton() async {
    await AppStorage.delete(key: LOG_BUTTON);
    isShowLog(false);
  }

  Future<void> getAppLanguageOptions() async {
    appLanguageOptions(
      RxList.from(appLanguageData.map((e) => AppLanguageModel.fromJson(e))),
    );
  }

  Future<void> getAppLanguage() async {
    final data = await AppStorage.read(key: APP_LANGUAGE);

    if (data.isNotEmpty) {
      final value = jsonDecode(data);

      appLanguage.value = AppLanguageModel(
        language: value['language'],
        locale: Locale(value['language_code'], value['country_code']),
      );

      await Get.updateLocale(
        Locale(value['language_code'], value['country_code']),
      );
    } else {
      await Get.updateLocale(const Locale('en', 'US'));
    }
  }

  Future<void> changeLanguage(AppLanguageModel value) async {
    appLanguage.value = value;

    final data = {
      'language': value.language,
      'language_code': value.locale.languageCode,
      'country_code': value.locale.countryCode,
    };

    await AppStorage.write(key: APP_LANGUAGE, value: jsonEncode(data));

    await Get.updateLocale(
      Locale(value.locale.languageCode, value.locale.countryCode),
    );
  }
}
