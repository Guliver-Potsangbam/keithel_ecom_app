import 'package:get/get.dart';

import '../../repository/authentication_repository/authentication_repository.dart';

class SignOutController extends GetxController {
  static SignOutController get instance => Get.find();

  void signOut() {
    AuthenticationRepository.instance.logout();
  }
}
