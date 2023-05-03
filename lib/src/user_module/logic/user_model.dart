//FIrestore Step 1 - Create User Model

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String fullName;
  final String email;
  final String password;
  final String phoneNo;
  final String address;
  final dynamic timestamp;

  const UserModel({
    required this.fullName,
    required this.email,
    required this.password,
    required this.phoneNo,
    required this.address,
    required this.timestamp,
  });

  toJson() {
    return {
      "fullName": fullName,
      "email": email,
      "password": password,
      "phoneNo": phoneNo,
      "address": address,
      "timestamp": timestamp,
    };
  }

  // Step 1 - Map user fetched from Firebase to User Model
  // with factory object and dot, we can create
  //multiple constructors with different names.

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
      // id: document.id,    when we want the user id also
      fullName: data["fullName"],
      email: data["email"],
      password: data["password"],
      phoneNo: data["phoneNo"],
      address: data["address"],
      timestamp: data["timestamp"],
    );
  }
}
