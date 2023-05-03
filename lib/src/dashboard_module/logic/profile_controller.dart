import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../repository/authentication_repository/authentication_repository.dart';
import '../../repository/user_repository/user_repository.dart';
import '../../user_module/logic/user_model.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();


  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  

  //Step 3 - Get User Email and pass to UserRepository to fetch user records.
  getUserData() {
    final email = _authRepo.firebaseUser.value?.email;
    log(email.toString());
    if (email != null) {
      return _userRepo.getUserDetails(email);
    } else {
      Get.snackbar('Error', 'Login to continue');
    }
  }

  Future<List<UserModel>> getAllUsers() async {
    return await _userRepo.getAllUsersDetails();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getAllUsersStream() {
    return _userRepo.getUsersStream();
  }

  Stream<UserModel> getCurrentUserStream() {
    final email = FirebaseAuth.instance.currentUser?.email as String;
    log('profile controller - $email');

    return _userRepo.getCurrentUserStream(email);
  }

  updateRecord(UserModel user) async {
    await _userRepo.updateUserRecord(user);
  }
}
