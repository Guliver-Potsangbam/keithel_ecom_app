import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keithel/src/login_module/pages/signup_page.dart';

import '../../core/constants/image_strings.dart';
import '../../core/constants/sizes.dart';
import '../../core/constants/text_strings.dart';

class SignInFooter extends StatelessWidget {
  const SignInFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("OR"),
        const SizedBox(height: gFormHeight - 20),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
              icon: const Image(
                image: AssetImage(googlePath),
                width: 20.0,
              ),
              onPressed: () {},
              label: const Text(gSignInWithGoogle)),
        ),
        const SizedBox(height: gFormHeight - 20),
        Align(
          alignment: Alignment.centerLeft,
          child: TextButton(
            onPressed: () {
              Get.to(() => const SignUpPage());
            },
            child: Text.rich(
              TextSpan(
                  text: gDonthaveAnAccount,
                  style: Theme.of(context).textTheme.bodyLarge,
                  children: const [
                    TextSpan(
                      text: ' $gSignUp',
                      style: TextStyle(color: Colors.blue),
                    )
                  ]),
            ),
          ),
        )
      ],
    );
  }
}
