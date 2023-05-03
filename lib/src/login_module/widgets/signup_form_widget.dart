import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keithel/src/login_module/logic/signup_controller.dart';
import 'package:keithel/src/login_module/pages/otp_verify_page.dart';
import 'package:keithel/src/user_module/logic/user_model.dart';
import 'package:pinput/pinput.dart';
import 'package:country_calling_code_picker/picker.dart';

import '../../core/constants/sizes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../logic/signin_controller.dart';

class SignUpFormWidget extends StatefulWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  State<SignUpFormWidget> createState() => _SignUpFormWidgetState();
}

class _SignUpFormWidgetState extends State<SignUpFormWidget> {
  @override
  void initState() {
    initCountry();
    super.initState();
  }

  Country? _selectedCountry;

  void initCountry() async {
    // final country = await getDefaultCountry(context);
    final country = await getCountryByCountryCode(context, 'IN');
    setState(() {
      _selectedCountry = country;
    });
  }

  _storeUserInfo() async {
    print('Shared pref called');
    int isLogin = 1;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('user', isLogin);
    print(prefs.getInt('user'));
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final _formKey = GlobalKey<FormState>();
    final country = _selectedCountry;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: gFormHeight - 10),
      child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: controller.fullName,
                // validator: (value) {
                //   if (value!.isEmpty) {
                //     return "Enter your full name";
                //   }
                // },
                decoration: const InputDecoration(
                  label: Text("Full Name"),
                  prefixIcon: Icon(Icons.person_outline_rounded),
                ),
              ),
              const SizedBox(height: gFormHeight - 20),
              TextFormField(
                controller: controller.email,
                validator: (value) {
                  bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.!#$%&'*+-/==?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]")
                      .hasMatch(value!);

                  if (value.isEmpty) {
                    return "Enter Email";
                  } else if (!emailValid) {
                    return "Enter Valid Email";
                  }
                },
                decoration: const InputDecoration(
                  label: Text("Email"),
                  prefixIcon: Icon(Icons.email_outlined),
                ),
              ),
              const SizedBox(height: gFormHeight - 20),
              TextFormField(
                controller: controller.password,
                // validator: (value) {
                //   if (value!.isEmpty) {
                //     return "Enter Password";
                //   } else if (controller.password.length < 6) {
                //     return "Password length should be atleast 6 characters";
                //   }
                // },
                decoration: const InputDecoration(
                  label: Text("Password"),
                  prefixIcon: Icon(Icons.lock_outline_rounded),
                ),
              ),
              const SizedBox(height: gFormHeight - 20),
              TextFormField(
                keyboardType: TextInputType.phone,
                controller: controller.phoneNo,
                // validator: (value) {
                //   if (value!.isEmpty) {
                //     return "Enter Phone Number";
                //   } else if (controller.phoneNo.length != 10) {
                //     return "Phone Number should be exactly 10 digits";
                //   }
                // },
                maxLength: 10,
                decoration: InputDecoration(
                  label: Text("Phone Number"),
                  prefixIcon: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            final country = await showCountryPickerSheet(
                              context,
                            );
                            if (country != null) {
                              setState(() {
                                _selectedCountry = country;
                              });
                            }
                          },
                          child: country == null
                              ? Container()
                              : Column(
                                  children: <Widget>[
                                    Image.asset(
                                      country.flag,
                                      package: countryCodePackageName,
                                      width: 30,
                                    ),
                                  ],
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: gFormHeight - 20),
              TextFormField(
                controller: controller.address,
                maxLines: 2,
                // validator: (value) {
                //   if (value!.isEmpty) {
                //     return "Enter Address";
                //   }
                // },
                decoration: const InputDecoration(
                  label: Text("Address"),
                  prefixIcon: Icon(Icons.location_pin),
                ),
              ),
              const SizedBox(height: gFormHeight - 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      //Email & Password Authentication
                      // SignUpController.instance.registerUser(
                      //     controller.email.text.trim(),
                      //     controller.password.text.trim());
                      // _storeUserInfo();

                      //For Phone Authentication
                      // SignInController.instance
                      //     .getCode(controller.phoneNo.text.trim());

                      /*
                      ============
                      Firestore Step 3 - Get User and pass it to Controller 
                      ============
                      */

                      final user = UserModel(
                        fullName: controller.fullName.text.trim(),
                        email: controller.email.text.trim(),
                        password: controller.password.text.trim(),
                        phoneNo: country!.callingCode +
                            controller.phoneNo.text.trim(),
                        address: controller.address.text.trim(),
                        timestamp: FieldValue.serverTimestamp(),
                      );

                      // SignUpController.instance
                      //     .registerUser(user.email, user.password);
                      // _storeUserInfo();

                      SignUpController.instance.createUserWithPhone(user);
                    }
                  },
                  child: Text("Sign Up with Phone Number".toUpperCase()),
                ),
              ),
              const SizedBox(height: gFormHeight - 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      //Email & Password Authentication
                      // SignUpController.instance.registerUser(
                      //     controller.email.text.trim(),
                      //     controller.password.text.trim());
                      // _storeUserInfo();

                      //For Phone Authentication
                      // SignInController.instance
                      //     .getCode(controller.phoneNo.text.trim());

                      /*
                      ============
                      Firestore Step 3 - Get User and pass it to Controller 
                      ============
                      */

                      final user = UserModel(
                        fullName: controller.fullName.text.trim(),
                        email: controller.email.text.trim(),
                        password: controller.password.text.trim(),
                        phoneNo: country!.callingCode +
                            controller.phoneNo.text.trim(),
                        address: controller.address.text.trim(),
                        timestamp: FieldValue.serverTimestamp(),
                      );

                      // SignUpController.instance
                      //     .registerUser(user.email, user.password);
                      // _storeUserInfo();

                      SignUpController.instance.createUserWithEmail(user);
                      _storeUserInfo();
                    }
                  },
                  child: Text("Sign Up with Email".toUpperCase()),
                ),
              )
            ],
          )),
    );
  }
}
