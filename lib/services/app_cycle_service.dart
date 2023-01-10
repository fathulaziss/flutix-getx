import 'dart:async';

import 'package:flutix/app/routes/app_pages.dart';
import 'package:flutix/constants/constant.dart';
import 'package:flutix/utils/app_storage.dart';
import 'package:flutix/utils/app_utils.dart';
import 'package:flutix/widgets/others/show_dialog.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AppCycleService {
  factory AppCycleService() {
    return _instance;
  }
  AppCycleService._internal() {
    logSys('AppCylceService Initialized');
  }

  static final AppCycleService _instance = AppCycleService._internal();

  Timer? tokenExpiredTimer;

  Future<void> setTokenWithTimer(String token) async {
    await AppStorage.write(key: CACHE_ACCESS_TOKEN, value: token);
    final exp = JwtDecoder.getExpirationDate(token);

    final expiredInMS =
        exp.millisecondsSinceEpoch - DateTime.now().millisecondsSinceEpoch;
    final d = Duration(milliseconds: expiredInMS);
    logSys('expiredInMS: $expiredInMS');
    logSys(
      'Time now: ${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}',
    );
    if (tokenExpiredTimer != null) {
      tokenExpiredTimer!.cancel();
    }
    tokenExpiredTimer = null;
    tokenExpiredTimer = Timer(d, () async {
      showPopUpInfo(
        title: 'Mohon maaf',
        description: 'Sesi anda telah berakhir, silakan login kembali.',
        labelButton: 'LOGIN',
        onPress: () {
          onUserLogout();
        },
      );
    });
  }

  Future<void> checkTokenAndRoute() async {
    try {
      //* CHECK PHONE JAILBROKEN
      if (await AppUtils.checkIsJailBroken()) {
        await Get.offNamed(Routes.BLOCKED);
        return;
      }

      //* CHECK FIRST TIME OPEN APP
      final value = await AppStorage.read(key: APP_FIRST_TIME_OPEN);
      if (value.isEmpty) {
        await Get.offNamed(Routes.ONBOARDING);
        return;
      }

      //* CHECK TOKEN
      final token = await AppStorage.read(key: CACHE_ACCESS_TOKEN);
      if (token.isEmpty) {
        await Get.offNamed(Routes.LOGIN);
        return;
      }

      // final isValid = await AppUtils.checkTokenValidity(token);
      // if (isValid) {
      //   await Get.offNamed(Routes.HOME);
      //   return;
      // }

      //* DEFAULT ROUTES TO HOME
      await Get.offNamed(Routes.HOME);
    } on Exception {
      await Get.offNamed(Routes.LOGIN);
    }
  }

  Future<void> onUserLogout() async {
    await AppStorage.delete(key: CACHE_ACCESS_TOKEN);

    try {
      tokenExpiredTimer!.cancel();
    } catch (e) {
      logSys(e.toString());
    } finally {
      tokenExpiredTimer = null;
    }

    await Future.delayed(const Duration(milliseconds: 500));

    await Get.offAllNamed(Routes.LOGIN);
  }
}
