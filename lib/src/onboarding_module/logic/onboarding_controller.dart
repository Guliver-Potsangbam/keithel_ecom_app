import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keithel/src/core/constants/colors.dart';
import 'package:keithel/src/core/constants/image_strings.dart';
import 'package:keithel/src/core/constants/text_strings.dart';

import 'package:keithel/src/onboarding_module/data/onboarding_model.dart';
import 'package:keithel/src/onboarding_module/widgets/onboarding_page_widget.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';

class OnBoardingController extends GetxController {
  final controller = LiquidController();
  RxInt currentPage = 0.obs;
  Rx<Widget> slideIcon = Icon(Icons.arrow_back_ios).obs;

  final pages = [
    OnBoardingPageWidget(
      model: OnBoardingModel(
        image: gOnBoardingImage1,
        title: gOnBoadingTitle1,
        subTitle: gOnBoadingSubTitle1,
        counterText: gOnBoadingCounter1,
        bgColor: gOnBoardingPage1Color,
      ),
    ),
    OnBoardingPageWidget(
      model: OnBoardingModel(
        image: gOnBoardingImage2,
        title: gOnBoadingTitle2,
        subTitle: gOnBoadingSubTitle2,
        counterText: gOnBoadingCounter2,
        bgColor: gOnBoardingPage2Color,
      ),
    ),
    OnBoardingPageWidget(
      model: OnBoardingModel(
        image: gOnBoardingImage3,
        title: gOnBoadingTitle3,
        subTitle: gOnBoadingSubTitle3,
        counterText: gOnBoadingCounter3,
        bgColor: gOnBoardingPage3Color,
      ),
    ),
  ];

  void onPageChangedCallback(int activePageIndex) {
    currentPage.value = activePageIndex;
    activePageIndex == pages.length - 1
        ? slideIcon.value = Icon(null)
        : slideIcon.value = Icon(Icons.arrow_back_ios);
  }

  animateToNextSlide() {
    int nextPage = controller.currentPage + 1;
    controller.animateToPage(page: nextPage);
  }
}
