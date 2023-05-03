import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keithel/src/login_module/logic/signin_controller.dart';
import 'package:keithel/src/repository/user_repository/user_repository.dart';

import '../../repository/authentication_repository/authentication_repository.dart';
import '../../user_module/logic/user_model.dart';
import '../pages/otp_verify_page.dart';
import '../pages/verify_email_page.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final userRepo = Get.put(UserRepository());
  final signInCont = Get.put(SignInController());

  final fullName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final phoneNo = TextEditingController();
  final address = TextEditingController();

  //Create user with email and password with no firestore

  void registerUser(String email, String password) {
    AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password);
  }

  void createUserWithPhone(UserModel user) async {
    await userRepo.createUser(user);
    AuthenticationRepository.instance.phoneAuthentication(user.phoneNo);
    Get.to(() => OTPVerifyPage(
          phoneNo: user.phoneNo,
        ));
  }

  void createUserWithEmail(UserModel user) async {
    await userRepo.createUser(user);
    AuthenticationRepository.instance
        .createUserWithEmailAndPassword(user.email, user.password);
  }
}
