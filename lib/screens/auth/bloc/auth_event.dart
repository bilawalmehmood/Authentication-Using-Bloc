part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class SignInFieldsEvent extends AuthEvent {
  final String emailValu;
  final String passwordValue;
  SignInFieldsEvent({
    required this.emailValu,
    required this.passwordValue,
  });
}

class SignInSubmitEvent extends AuthEvent {
  final String email;
  final String password;
  SignInSubmitEvent({
    required this.email,
    required this.password,
  });
}
