import 'package:flutix/app/modules/onboarding/models/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  PageController cSlideTile = PageController();
  RxInt slideIndex = 0.obs;
  List<OnboardingModel> listSlideTile = [
    OnboardingModel(
      image: 'img_app.png',
      title: 'Slide Tile 1',
      desc:
          'Lorem ipsum dolor sit amet, consectetur adipi elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi u.',
    ),
    OnboardingModel(
      image: 'img_app.png',
      title: 'Slide Tile 2',
      desc:
          'Lorem ipsum dolor sit amet, consectetur adipi elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minimveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure d',
    ),
    OnboardingModel(
      image: 'img_app.png',
      title: 'Slide Tile 3',
      desc:
          'Lorem ipsum dolor sit amet, consectetur adipi elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minimveniam, quis',
    ),
  ];
}
