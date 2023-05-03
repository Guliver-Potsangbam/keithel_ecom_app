import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keithel/src/login_module/logic/signin_controller.dart';

import 'package:pinput/pinput.dart';

import '../../core/constants/sizes.dart';
import '../../core/constants/text_strings.dart';
import '../widgets/timer.dart';

@RoutePage()
class OTPVerifyPage extends StatefulWidget {
  OTPVerifyPage({super.key, required this.phoneNo});

  String phoneNo;

  @override
  State<OTPVerifyPage> createState() => _OTPVerifyPageState();
}

class _OTPVerifyPageState extends State<OTPVerifyPage> {
  final pinController = TextEditingController();

  final pinKey = GlobalKey<FormState>();

  final timer = MyTimer(start: 30);

  @override
  void initState() {
    super.initState();
    timer.startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancelTimer();
  }

  @override
  Widget build(BuildContext context) {
    var otp;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(gDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Section 1 [Header]
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(gVerifyOtpTitle,
                      style: Theme.of(context).textTheme.displayLarge),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('$gVerifyOtpSubTitle ${widget.phoneNo}',
                      style: Theme.of(context).textTheme.bodyLarge),
                ]),

                //Section 2 [PinPut]
                Container(
                  padding: const EdgeInsets.only(
                      top: gFormHeight + 20, bottom: gFormHeight),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Form(
                        key: pinKey,
                        child: Pinput(
                            length: 6,
                            showCursor: true,
                            onCompleted: (pin) {
                              print(pin);
                              otp = pin;
                              SignInController.instance.verifyCode(otp);
                            },
                            androidSmsAutofillMethod:
                                AndroidSmsAutofillMethod.none,
                            controller: pinController,
                            errorText: 'Incorrect Pin',

                            /// ------------
                            /// With Validator
                            /// Auto validate after user tap on keyboard done button, or completes Pinput
                            pinputAutovalidateMode:
                                PinputAutovalidateMode.onSubmit,
                            validator: (pin) {
                              if (pin == '123456') return null;

                              // // Text will be displayed under the Pinput
                              // return 'Pin is incorrect';
                            }),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(
                        () => timer.st.value != 0
                            ? Text(
                                "Expires in ${timer.st.value}",
                                style: const TextStyle(fontSize: 12),
                              )
                            : OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.all(10),
                                ),
                                child: const Text('Resend OTP'),
                              ),
                      ),
                    ],
                  ),
                ),
                //Section 3 [Footer]
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        SignInController.instance.verifyCode(otp);
                      },
                      child: const Text("Start Shopping")),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
