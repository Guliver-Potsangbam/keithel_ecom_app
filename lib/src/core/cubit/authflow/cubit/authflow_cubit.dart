import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keithel/src/user_module/logic/user_model.dart';

part 'authflow_state.dart';

class AuthflowCubit extends Cubit<AuthflowState> {
  AuthflowCubit() : super(const AuthflowState(status: Status.initial)) {
    authCheck();
  }

  get userdata => null;

  authCheck() {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        emit(const AuthflowState(status: Status.logout));
      } else {
        emit(const AuthflowState(status: Status.login));
      }
    });
  }
}
