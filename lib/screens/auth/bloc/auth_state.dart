// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class SignInitialState extends AuthState {}

class SignInValidState extends AuthState {}

class SignInErrorState extends AuthState {
  final String errorMessage;
  SignInErrorState({
    required this.errorMessage,
  });
}

class SignInLoadingState extends AuthState {}
