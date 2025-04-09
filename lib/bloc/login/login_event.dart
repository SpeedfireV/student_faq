sealed class LoginEvent {}

final class LoginSubmitForm extends LoginEvent {
  final String emailAddress;
  final String password;
  LoginSubmitForm(this.emailAddress, this.password);
}
