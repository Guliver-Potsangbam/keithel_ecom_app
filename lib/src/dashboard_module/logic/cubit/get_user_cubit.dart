import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keithel/src/user_module/logic/user_model.dart';

part 'get_user_state.dart';

class GetUserCubit extends Cubit<GetUserState> {
  GetUserCubit() : super(const GetUserState(status: Status.initial)) {
    getUserData();
  }

  bool get isLoading => state.status == Status.loading;

  getUserData() {
    if (isLoading) {
      return;
    }

    var email = FirebaseAuth.instance.currentUser!.email;
    FirebaseFirestore.instance
        .collection("Users")
        .doc(email)
        .snapshots()
        .listen((event) {
      var user = UserModel.fromSnapshot(event);
      emit(GetUserState(status: Status.loaded, user: user));
    });
  }
}
