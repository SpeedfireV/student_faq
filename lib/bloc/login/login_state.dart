import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginParsing extends LoginState {}

final class LoginSuccessful extends LoginState {}

final class LoginUnsuccessful extends LoginState {
  final FirebaseAuthException error;
  LoginUnsuccessful(this.error);
}

final class LoginError extends LoginState {
  final error;
  LoginError(this.error);
}
