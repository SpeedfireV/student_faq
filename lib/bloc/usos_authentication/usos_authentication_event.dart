part of 'usos_authentication_bloc.dart';

@immutable
sealed class UsosAuthenticationEvent {}

class UsosAuthenticationObtainPIN extends UsosAuthenticationEvent {}

class UsosAuthenticationAuthenticate extends UsosAuthenticationEvent {
  final String PIN;

  UsosAuthenticationAuthenticate(this.PIN);
}
