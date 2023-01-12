import 'package:flutix/app/modules/api_log/bindings/api_log_binding.dart';
import 'package:flutix/app/modules/api_log/views/api_log_view.dart';
import 'package:flutix/app/modules/blocked_view.dart';
import 'package:flutix/app/modules/home/bindings/home_binding.dart';
import 'package:flutix/app/modules/home/views/home_view.dart';
import 'package:flutix/app/modules/onboarding/bindings/onboarding_binding.dart';
import 'package:flutix/app/modules/onboarding/views/onboarding_view.dart';
import 'package:flutix/app/modules/signin/bindings/signin_binding.dart';
import 'package:flutix/app/modules/signin/views/signin_view.dart';
import 'package:flutix/app/modules/signup/bindings/signup_binding.dart';
import 'package:flutix/app/modules/signup/views/signup_confirm_view.dart';
import 'package:flutix/app/modules/signup/views/signup_two_view.dart';
import 'package:flutix/app/modules/signup/views/signup_view.dart';
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
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.SIGNIN,
      page: () => const SigninView(),
      binding: SigninBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP_TWO,
      page: () => const SignupTwoView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP_CONFIRM,
      page: () => const SignupConfirmView(),
      binding: SignupBinding(),
    ),
  ];
}
