import 'package:authenticatio_with_bloc/services/firebase/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  AuthCubit() : super(AuthInitialState());

  void sendOTP(String phoneNo) async {
    emit(AuthLoadingState());
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNo,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          emit(AuthErrorState(
            message: e.message.toString(),
          ));
        },
        codeSent: (String verificationId, int? resendToken) async {
          emit(AuthCodeSentState(
              verificationId: verificationId, phoneNo: phoneNo));
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          emit(AuthCodeSentState(
              verificationId: verificationId, phoneNo: phoneNo));
        },
      );
    } on FirebaseAuthException catch (e) {
      emit(AuthErrorState(
        message: e.toString(),
      ));
    }
  }

  void verifyOTP(String verificationId, String smsCode) async {
    emit(AuthLoadingState());
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );

      final UserCredential authResult =
          await _auth.signInWithCredential(credential);
      final User? user = authResult.user;

      if (user != null) {
        emit(AuthCodeVerifiedState(user: user));
      } else {
        emit(AuthErrorState(
          message: "User is null",
        ));
      }
    } on FirebaseAuthException catch (e) {
      emit(AuthErrorState(
        message: e.toString(),
      ));
    }
  }
}
