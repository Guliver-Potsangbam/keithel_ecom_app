import 'dart:async';

import 'package:auto_route/annotations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keithel/src/core/constants/sizes.dart';
import 'package:keithel/src/dashboard_module/pages/dashboard_page.dart';

import '../../repository/authentication_repository/authentication_repository.dart';

@RoutePage()
class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({super.key});

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  final authRepo = Get.put(AuthenticationRepository());
  late User user;
  late Timer timer;

  @override
  void initState() {
    user = authRepo.auth.currentUser!;
    user.sendEmailVerification();

    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      checkEmailVerified();
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Email'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(gDefaultSize),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'A verification email has been sent to ${user.email}. Please verify',
              textAlign: TextAlign.center,
            ),
          ]),
        ),
      ),
    );
  }

  void checkEmailVerified() async {
    user = authRepo.auth.currentUser!;
    await user.reload();
    if (user.emailVerified) {
      timer.cancel();
      Get.offAll(() => DashboardPage());
    }
  }
}
