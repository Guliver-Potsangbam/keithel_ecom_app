import 'package:flutter/material.dart';
import 'package:keithel/src/onboarding_module/logic/onboarding_controller.dart';
import 'package:keithel/src/onboarding_module/data/onboarding_model.dart';

import '../../core/constants/sizes.dart';

class OnBoardingPageWidget extends StatelessWidget {
  OnBoardingPageWidget({
    super.key,
    required this.model,
  });

  final OnBoardingModel model;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(gDefaultSize),
      width: double.infinity,
      color: model.bgColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            image: AssetImage(model.image),
            height: 0.4 * screenSize.height,
          ),
          Column(
            children: [
              Text(
                model.title,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                model.subTitle,
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Text(
            model.counterText,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          SizedBox(
            height: 20.0,
          )
        ],
      ),
    );
  }
}
