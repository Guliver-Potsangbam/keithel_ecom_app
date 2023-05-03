import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keithel/src/core/constants/sizes.dart';
import 'package:keithel/src/core/router/app_route.gr.dart';
import 'package:keithel/src/login_module/logic/signin_controller.dart';
import 'package:keithel/src/login_module/pages/sms_signIn.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/constants/text_strings.dart';

class EmailSignInForm extends StatefulWidget {
  const EmailSignInForm({
    super.key,
  });

  @override
  State<EmailSignInForm> createState() => _EmailSignInFormState();
}

class _EmailSignInFormState extends State<EmailSignInForm> {
  var isPwdVisible = false;

  _storeUserInfo() async {
    print('Shared pref called');
    int isLogin = 1;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('user', isLogin);
    print(prefs.getInt('user'));
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignInController());
    return Form(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: gFormHeight - 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller.email,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_outline_rounded),
                labelText: gEmail,
                hintText: gEmail,
              ),
            ),
            const SizedBox(height: gFormHeight - 20),
            TextFormField(
              obscureText: !isPwdVisible,
              controller: controller.password,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock_outline_rounded),
                labelText: gPassword,
                hintText: gPassword,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isPwdVisible = !isPwdVisible;
                    });
                  },
                  icon: Icon(
                      isPwdVisible ? Icons.visibility : Icons.visibility_off),
                ),
              ),
            ),
            const SizedBox(height: gFormHeight - 20),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {}, child: const Text(gForgetPassword)),
            ),
            const SizedBox(height: gFormHeight - 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  SignInController.instance.logInWithEmailAndPassword(
                      controller.email.text.trim(),
                      controller.password.text.trim());
                  _storeUserInfo();
                  context.router.push(const DashboardRoute());
                },
                child: Text(gLogIn.toUpperCase()),
              ),
            ),
            const SizedBox(height: gFormHeight - 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => const SmsSignInPage());
                },
                child: const Text(gSignInWithMobileNumber),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
