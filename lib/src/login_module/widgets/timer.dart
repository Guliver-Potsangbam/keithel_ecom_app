import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class MyTimer extends GetxController {
  MyTimer({required this.start});

  late Timer _timer;

  int start;

  late RxInt st = start.obs;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        st.value == 0 ? timer.cancel() : st.value--;
      },
    );
  }

  void cancelTimer() {
    _timer.cancel();
  }
}
