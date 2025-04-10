import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_faq/bloc/login/login_event.dart';
import 'package:student_faq/bloc/login/login_state.dart';
import 'package:student_faq/services/auth_service.dart';
import 'package:student_faq/services/database_service.dart';
import 'package:student_faq/services/user_data_service.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginSubmitForm>((event, emit) async {
      emit(LoginParsing());
      try {
        final UserCredential? userCredential =
            await AuthService.register(event.emailAddress, event.password);

        // await DatabaseService.createUserData(
        //     FirebaseAuth.instance.currentUser!);
        emit(LoginSuccessful());
      } on FirebaseAuthException catch (e) {
        emit(LoginUnsuccessful(e));
      } catch (e) {
        emit(LoginError(e));
      }
    });
  }
}
