// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitialState extends AuthState {}

class AuthCodeSentState extends AuthState {
  final String verificationId;
  final String phoneNo;

  AuthCodeSentState({required this.verificationId, required this.phoneNo});
}

class AuthCodeVerifiedState extends AuthState {
  final User user;
  AuthCodeVerifiedState({required this.user});
}

class AuthLoadingState extends AuthState {}

class AuthErrorState extends AuthState {
  final String message;

  AuthErrorState({required this.message});
}
