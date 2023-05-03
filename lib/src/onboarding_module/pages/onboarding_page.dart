import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keithel/src/core/router/app_route.gr.dart';

import 'package:keithel/src/onboarding_module/logic/onboarding_controller.dart';

import 'package:keithel/src/welcome_module/pages/welcome_page.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class OnBoardingPage extends StatelessWidget {
  OnBoardingPage({super.key});

  _storeOnBoardInfo() async {
    print('Shared pref called');
    int isViewed = 1;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
    print(prefs.getInt('onBoard'));
  }

  @override
  Widget build(BuildContext context) {
    final obController = OnBoardingController();
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Obx(
            () => LiquidSwipe(
              pages: obController.pages,
              enableLoop: false,
              liquidController: obController.controller,
              onPageChangeCallback: obController.onPageChangedCallback,
              slideIconWidget: obController.slideIcon.value,
              enableSideReveal: true,
            ),
          ),
          Obx(
            () =>
                obController.currentPage.value == obController.pages.length - 1
                    ? Positioned(
                        bottom: 100.0,
                        child: ElevatedButton(
                          onPressed: () {
                            _storeOnBoardInfo();
                            context.router.push(const WelcomeRoute());
                          },
                          child: Text('Get Started'),
                        ),
                      )
                    : Positioned(
                        bottom: 100.0,
                        child: OutlinedButton(
                          onPressed: () {
                            obController.animateToNextSlide();
                          },
                          style: ElevatedButton.styleFrom(
                            side: const BorderSide(color: Colors.black26),
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(15),
                            backgroundColor: Colors.white,
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                                color: Colors.black26, shape: BoxShape.circle),
                            child: const Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                      ),
          ),
          Positioned(
            top: 15,
            right: 15,
            child: TextButton(
              onPressed: () {
                _storeOnBoardInfo();
                context.router.push(const WelcomeRoute());
              },
              child: const Text(
                "Skip",
                style: const TextStyle(color: Colors.grey),
              ),
            ),
          ),
          Obx(
            () => Positioned(
              bottom: 30,
              child: AnimatedSmoothIndicator(
                activeIndex: obController.currentPage.value,
                count: 3,
                effect: const WormEffect(
                  activeDotColor: Colors.black,
                  dotHeight: 5.0,
                  // dotWidth: 8.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
