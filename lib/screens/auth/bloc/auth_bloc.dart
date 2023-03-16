import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(SignInitialState()) {
    on<SignInFieldsEvent>((event, emit) {
      if (event.emailValu == "" ||
          EmailValidator.validate(event.emailValu) == false) {
        emit(SignInErrorState(errorMessage: "Please Enter Valid Email"));
      } else if (event.passwordValue.length < 8) {
        emit(SignInErrorState(errorMessage: "Enter 8 Char Password"));
      } else {
        emit(SignInValidState());
      }
    });
    on<SignInSubmitEvent>((event, emit) {
      emit(SignInLoadingState());
    });
  }
}
