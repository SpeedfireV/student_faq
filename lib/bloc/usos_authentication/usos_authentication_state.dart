part of 'usos_authentication_bloc.dart';

@immutable
sealed class UsosAuthenticationState {}

final class UsosAuthenticationInitial extends UsosAuthenticationState {}

class UsosAuthenticationObtainingPin extends UsosAuthenticationState {}

class UsosAuthenticationPinObtained extends UsosAuthenticationState {}

class UsosAuthenticationUserAuthenticated extends UsosAuthenticationState {}

class UsosAuthenticationError extends UsosAuthenticationState {
  final String error;

  UsosAuthenticationError(this.error);
}