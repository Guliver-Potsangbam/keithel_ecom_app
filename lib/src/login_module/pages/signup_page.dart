import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import 'package:keithel/src/core/constants/image_strings.dart';
import 'package:keithel/src/core/constants/sizes.dart';
import 'package:keithel/src/core/constants/text_strings.dart';
import 'package:keithel/src/login_module/pages/email_signIn.dart';

import 'package:keithel/src/login_module/widgets/signup_form_header.dart';
import '../widgets/signup_form_widget.dart';

@RoutePage()
class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(gDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FormHeaderWidget(
                  image: gWelcomeScreenImage,
                  title: gSignupTitle,
                  subTitle: gSignupSubTitle,
                ),
                const SignUpFormWidget(),
                Column(
                  children: [
                    const Text("OR"),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Image(
                          image: AssetImage(googlePath),
                          height: 16,
                        ),
                        label: Text("Sign In With Google".toUpperCase()),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EmailSignInPage(),
                            ));
                      },
                      child: Text.rich(
                        TextSpan(children: [
                          TextSpan(
                              text: 'Already have an Account ?',
                              style: Theme.of(context).textTheme.bodyLarge),
                          TextSpan(text: "  $gLogIn"),
                        ]),
                      ),
                    )
                  ],
                )
              ],
            )),
      ),
    ));
  }
}
