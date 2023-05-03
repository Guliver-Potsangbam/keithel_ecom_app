//FIrestore Step 2 - User Repository to perform Database Operations

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:developer';
import '../../user_module/logic/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

// Store user in Firestore wih generated DocID
  // createUser(UserModel user) async {
  //   await _db
  //       .collection("Users")
  //       .add(user.toJson())
  //       .whenComplete(
  //         () => Get.snackbar("Success", "You account has been created.",
  //             snackPosition: SnackPosition.BOTTOM,
  //             backgroundColor: Colors.green.withOpacity(0.1),
  //             colorText: Colors.green),
  //       )
  //       .catchError((error, stackTrace) {
  //     Get.snackbar("Error", "Something went wrong. Try again.",
  //         snackPosition: SnackPosition.BOTTOM,
  //         backgroundColor: Colors.redAccent.withOpacity(0.1),
  //         colorText: Colors.red);
  //     print(error.toString());
  //   });
  // }

  //Store user in Firestore with custom DocID
  createUser(UserModel user) async {
    await _db
        .collection("Users")
        .doc(user.email.toString())
        .set(user.toJson())
        .whenComplete(
          () => Get.snackbar("Success", "You account has been created.",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green.withOpacity(0.1),
              colorText: Colors.green),
        )
        .catchError((error, stackTrace) {
      Get.snackbar("Error", "Something went wrong. Try again.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
      print(error.toString());
    });
  }

// Step-2 - Fetch Single-User Details
  Future<UserModel> getUserDetails(String email) async {
    final snapshot =
        await _db.collection("Users").where("email", isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userData;
  }

  //Fetch all Users Details

  Future<List<UserModel>> getAllUsersDetails() async {
    final snapshot = await _db.collection("Users").get();
    final userData =
        snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return userData;
  }

  //Fetch Current User with Stream
  Stream<UserModel> getCurrentUserStream(String email) {
    final userStream = _db.collection("Users").doc(email).snapshots();

    //convert Map<String,dynamic> to UserModel
    final userData =
        userStream.map((snapshot) => UserModel.fromSnapshot(snapshot));

    log('done snapshot');

    return userData;
  }

  //Fetch All Users with Stream
  Stream<QuerySnapshot<Map<String, dynamic>>> getUsersStream() {
    final usersStream = _db.collection("Users").snapshots();

    return usersStream;
  }

  //Update UserData
  Future<void> updateUserRecord(UserModel user) async {
    await _db.collection("Users").doc(user.email).update(user.toJson());
  }
}
