import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_faq/bloc/login/login_event.dart';
import 'package:student_faq/bloc/login/login_state.dart';
import 'package:student_faq/services/auth_service.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginSubmitForm>((event, emit) async {
      emit(LoginParsing());
      try {
        final UserCredential? userCredential =
            await AuthService.register(event.emailAddress, event.password);
        emit(LoginSuccessful());
      } on FirebaseAuthException catch (e) {
        emit(LoginUnsuccessful(e));
      } catch (e) {
        emit(LoginError(e));
      }
    });
  }
}
