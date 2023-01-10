import 'package:flutix/app/modules/api_log/bindings/api_log_binding.dart';
import 'package:flutix/app/modules/api_log/views/api_log_view.dart';
import 'package:flutix/app/modules/blocked_view.dart';
import 'package:flutix/app/modules/home/bindings/home_binding.dart';
import 'package:flutix/app/modules/home/views/home_view.dart';
import 'package:flutix/app/modules/login/bindings/login_binding.dart';
import 'package:flutix/app/modules/login/views/login_view.dart';
import 'package:flutix/app/modules/onboarding/bindings/onboarding_binding.dart';
import 'package:flutix/app/modules/onboarding/views/onboarding_view.dart';
import 'package:flutix/app/modules/splash_screen_view.dart';
import 'package:flutix/app/modules/under_development.dart';
import 'package:get/get.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: _Paths.BLOCKED,
      page: () => const BlockedView(),
    ),
    GetPage(
      name: _Paths.UNDER_DEVELOPMENT,
      page: () => const UnderDevelopmentView(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.API_LOG,
      page: () => const ApiLogView(),
      binding: ApiLogBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
  ];
}
