import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keithel/src/core/constants/colors.dart';
import 'package:keithel/src/core/constants/sizes.dart';
import 'package:keithel/src/login_module/widgets/signIn_footer.dart';
import 'package:keithel/src/login_module/widgets/signIn_header.dart';
import 'package:keithel/src/login_module/widgets/email_signIn_form.dart';

@RoutePage()
class EmailSignInPage extends StatelessWidget {
  const EmailSignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
            statusBarColor: gWhiteColor,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark),
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(gDefaultSize),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Section 1 [Header]
                  SignInHeader(size: size),

                  //Section 2 [Form]
                  const EmailSignInForm(),

                  //Section 3 [Footer]
                  const SignInFooter()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
