import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keithel/src/dashboard_module/pages/dashboard_page.dart';
import 'package:keithel/src/repository/authentication_repository/authentication_repository.dart';

import '../../user_module/logic/user_model.dart';

class SignInController extends GetxController {
  static SignInController get instance => Get.find();

  final fullName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final phoneNo = TextEditingController();
  final otp = TextEditingController();

  void getCode(String phoneNo) {
    AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  }

  void verifyCode(String otp) async {
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    isVerified ? Get.offAll(const DashboardPage()) : Get.back();
  }

  void logInWithEmailAndPassword(String email, String password) async {
    AuthenticationRepository.instance
        .logInWithEmailAndPassword(email, password);
  }
}
