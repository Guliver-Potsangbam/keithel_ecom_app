import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:keithel/src/login_module/pages/verify_email_page.dart';
import '../../core/router/app_route.gr.dart';
import '../../dashboard_module/pages/dashboard_page.dart';
import 'exceptions/signup_email_failure.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //Variables
  final auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    // ever(firebaseUser, _setInitialScreen);
  }

  //Setting initial screen onLoad
  // _setInitialScreen(User? user) {
  //   user == null
  //       ? Get.offAll(() => const WelcomeScreen())
  //       : Get.offAll(() => const HomePage());
  // }

  //Setting initial screen onLoad
  // _setInitialScreen(User? user) {
  //   if (user == null) {
  //     Get.offAll(() => const WelcomeScreen());
  //   } else if (user.emailVerified) {
  //     Get.offAll(() => const HomePage());
  //   }
  // }

  //phoneAuthentication
  void phoneAuthentication(String phoneNo) async {
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNo,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // await auth.signInWithCredential(credential);
      },
      codeSent: (String verificationId, int? resendToken) {
        this.verificationId.value = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        this.verificationId.value = verificationId;
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          Get.snackbar('Error', 'The provided phone number is not valid');
        } else {
          Get.snackbar('Error', 'Something went wrong. Try again.');
        }
      },
    );
  }

  Future<bool> verifyOTP(String otp) async {
    var credentials = await auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: this.verificationId.value, smsCode: otp));
    return credentials.user != null ? true : false;
  }

  //Sign Up Function
  void createUserWithEmailAndPassword(String email, String password) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => Get.to(() => VerifyEmailPage()));

      // firebaseUser.value != null
      //     ? Get.to(() => const HomePage())
      //     : Get.to(() => const WelcomeScreen());
    } on FirebaseAuthException catch (e) {
      final exc = SignUpWithEmailAndPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${exc.message}');
      Get.snackbar('Error', exc.message);
      throw exc;
    } catch (_) {
      const exc = SignUpWithEmailAndPasswordFailure();
      print('EXCEPTION - ${exc.message}');
      throw exc;
    }
  }

  // Email LogIn Function
  void logInWithEmailAndPassword(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      // .then((value) => const HomeRoute());
    } on FirebaseAuthException catch (e) {
    } catch (_) {}
  }

  // Sign Out Function
  void logout() async => await auth.signOut();
}
