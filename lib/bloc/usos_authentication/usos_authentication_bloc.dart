import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:student_faq/services/usos_service.dart';

part 'usos_authentication_event.dart';
part 'usos_authentication_state.dart';

class UsosAuthenticationBloc
    extends Bloc<UsosAuthenticationEvent, UsosAuthenticationState> {
  UsosService usosService = UsosService();
  UsosAuthenticationBloc() : super(UsosAuthenticationInitial()) {
    on<UsosAuthenticationObtainPIN>((event, emit) async {
      emit(UsosAuthenticationObtainingPin());
      await usosService.obtainPIN();
      emit(UsosAuthenticationPinObtained());
    });
    on<UsosAuthenticationAuthenticate>((event, emit) async {
      await usosService.requestCredentialsUsingPin(event.PIN);
      await usosService.getStudentStatus();
      emit(UsosAuthenticationUserAuthenticated());
    });
  }

  @override
  void onTransition(
      Transition<UsosAuthenticationEvent, UsosAuthenticationState> transition) {
    print(transition);
  }
}
