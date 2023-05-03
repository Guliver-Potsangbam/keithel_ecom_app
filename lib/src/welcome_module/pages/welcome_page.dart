import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:keithel/src/core/constants/sizes.dart';
import 'package:keithel/src/core/router/app_route.gr.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/image_strings.dart';
import '../../core/constants/text_strings.dart';

@RoutePage()
class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return SafeArea(
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
            statusBarColor: isDarkMode ? gSecondaryColor : gPrimaryColor,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark),
        child: Scaffold(
          backgroundColor: isDarkMode ? gSecondaryColor : gPrimaryColor,
          // backgroundColor: Colors.yellow,
          body: Container(
            padding: const EdgeInsets.all(gDefaultSize),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image(
                    image: const AssetImage(gWelcomeScreenImage),
                    height: height * 0.6),
                Column(
                  children: [
                    Text(gWelcomeTitle,
                        style: Theme.of(context).textTheme.displaySmall),
                    Text(gWelcomeSubTitle,
                        style: Theme.of(context).textTheme.bodyLarge,
                        textAlign: TextAlign.center),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          // Get.to(() => const EmailSignInPage());
                          context.router.push(const EmailSignInRoute());
                        },
                        child: Text(gLogIn.toUpperCase()),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Get.to(() => const SignUpPage());
                          context.router.push(const SignUpRoute());
                        },
                        child: Text(gSignUp.toUpperCase()),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
