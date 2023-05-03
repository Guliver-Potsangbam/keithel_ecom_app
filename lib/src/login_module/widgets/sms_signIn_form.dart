import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:keithel/src/core/constants/text_strings.dart';
import 'package:country_calling_code_picker/picker.dart';
import 'package:keithel/src/login_module/logic/signin_controller.dart';

import '../../core/constants/sizes.dart';

import '../pages/email_signIn.dart';
import '../pages/otp_verify_page.dart';

class SmsSignInForm extends StatefulWidget {
  SmsSignInForm({
    super.key,
  });

  @override
  State<SmsSignInForm> createState() => _SmsSignInFormState();
}

class _SmsSignInFormState extends State<SmsSignInForm> {
  final _phoneformKey = GlobalKey<FormState>();

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

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignInController());
    final country = _selectedCountry;
    return Form(
      key: _phoneformKey,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: gFormHeight - 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              child: TextFormField(
                keyboardType: TextInputType.phone,
                maxLength: 10,
                controller: controller.phoneNo,
                decoration: InputDecoration(
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
                  labelText: gPhoneNumber,
                  hintText: gPhoneNumber,
                ),
              ),
            ),
            const SizedBox(height: gFormHeight - 20),
            Align(
                alignment: Alignment.centerLeft,
                child: FittedBox(
                  child: Row(
                    children: [
                      Text('By continuing, I agree to the'),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Terms of Use',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      Text('&'),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Privacy Policy',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                )),
            const SizedBox(height: gFormHeight - 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Get.to(() => OTPVerifyPage());
                  log(country!.callingCode + controller.phoneNo.text);
                  if (_phoneformKey.currentState!.validate()) {
                    SignInController.instance.getCode(
                        country.callingCode + controller.phoneNo.text.trim());
                    Get.to(() => OTPVerifyPage(
                          phoneNo:
                              country.callingCode + controller.phoneNo.text,
                        ));
                  }
                },
                child: Text("Continue".toUpperCase()),
              ),
            ),
            const SizedBox(height: gFormHeight - 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => const EmailSignInPage());
                },
                child: const Text(gSignInWithEmail),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
