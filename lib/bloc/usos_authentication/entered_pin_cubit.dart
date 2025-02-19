import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:student_faq/services/usos_service.dart';

class EnteredPinCubit extends Cubit<String> {
  EnteredPinCubit() : super("");
  Future<bool?> changePin(String newPin) async {
    emit(newPin);
    if (newPin.length == 8) {
      return true;
    } else {
      return false;
    }
  }
}
